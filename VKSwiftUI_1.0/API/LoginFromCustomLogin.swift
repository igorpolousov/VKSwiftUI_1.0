//
//  NavView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct LoginFromCustomLogin: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $isActive)
                
                NavigationLink(destination: LoginFromVkWebView(isActive: isActive), isActive: $isActive) {
                    EmptyView()
                }
                .navigationTitle("Login screen")
            }
        }
        .navigationBarHidden(true)
    }
}
