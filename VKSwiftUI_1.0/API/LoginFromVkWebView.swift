//
//  LoginFromVkWebView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct LoginFromVkWebView: View {
    
    @State var login: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                VkWebView(isUserLoggedIn: $login)

                NavigationLink(destination: TabBarView(), isActive: $login) {
                    EmptyView()
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
