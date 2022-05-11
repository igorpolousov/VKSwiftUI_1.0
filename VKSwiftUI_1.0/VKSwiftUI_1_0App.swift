//
//  VKSwiftUI_1_0App.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

@main
struct VKSwiftUI_1_0App: App {
    var body: some Scene {
        WindowGroup {
            LoginView(isUserLoggedIn: .constant(false))
        }
    }
}
