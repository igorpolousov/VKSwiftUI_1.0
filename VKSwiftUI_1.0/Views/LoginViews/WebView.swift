//
//  WebView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import Combine
import SwiftUI
import UIKit
import WebKit

struct VkWebView: UIViewRepresentable {
    
   //var successCompletion: () -> Void
    @Binding var isUserLoggedIn: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
   var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7833687"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends, wall, photos"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        return urlComponents
   }()
    
//    init(completion: @escaping () -> Void) {
//        successCompletion = completion
//    }

    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()

        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(makeCoordinator() as WKScriptMessageHandler, name: "iOSNative")
        configuration.preferences = preferences

        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)

        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        webView.navigationDelegate = context.coordinator

        return webView
    }

    func updateUIView(_ webView: WKWebView, context _: Context) {
        let request = URLRequest(url: urlComponents.url!)
        webView.load(request)
    }

    // MARK: Coordinator class
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: VkWebView
        var webViewNavigationSubscriber: AnyCancellable?
        

        init(_ uiWebView: VkWebView) {
            parent = uiWebView
        }

        deinit {
            webViewNavigationSubscriber?.cancel()
        }

        func webView(
            _: WKWebView,
            decidePolicyFor navigationResponse: WKNavigationResponse,
            decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
        ) {
            guard
                let url = navigationResponse.response.url,
                url.path == "/blank.html",
                let fragment = url.fragment
            else { return decisionHandler(.allow) }

            let parameters = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, params in
                    var dict = result
                    let key = params[0]
                    let value = params[1]
                    dict[key] = value
                    return dict
                }
            guard
                let token = parameters["access_token"],
                let userIDString = parameters["user_id"],
                let userID = Int(userIDString)

            else { return decisionHandler(.allow) }

            if token.count > 0 && userID > 0 {
                AuthSession.shared.userId = userIDString
                AuthSession.shared.token = token
                parent.isUserLoggedIn = true
                //parent.successCompletion()
            }

            decisionHandler(.cancel)
        }
    }
}

extension VkWebView.Coordinator: WKScriptMessageHandler {
    func userContentController(_: WKUserContentController, didReceive message: WKScriptMessage) {
        // Make sure that your passed delegate is called
        if message.name == "iOSNative" {
            if let body = message.body as? [String: Any?] {
                print("JSON value received from web is: \(body)")
            } else if let body = message.body as? String {
                print("String value received from web is: \(body)")
            }
        }
    }
}

