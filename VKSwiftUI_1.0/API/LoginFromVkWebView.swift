//
//  LoginFromVkWebView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct LoginFromVkWebView: View {
    @State var isActive: Bool
    var body: some View {
        NavigationView {
            VStack {
                VkWebView(isUserLoggedIn: $isActive)
                
                NavigationLink(destination: TabBarView(), isActive: $isActive) {
                    EmptyView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
