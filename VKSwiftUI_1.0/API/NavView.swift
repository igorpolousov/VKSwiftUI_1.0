//
//  NavView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct NavView: View {
    @State private var shouldShowWebView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowWebView)
                
                NavigationLink(destination: VkWebView(), isActive: $shouldShowWebView) {
                    EmptyView()
                }
                .navigationTitle("Login screen")
            }
        }
    }
}
