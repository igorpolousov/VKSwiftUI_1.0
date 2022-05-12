//
//  AuthSession.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//



final class AuthSession  {
    var token = ""
    var userId = ""
    static let shared = AuthSession()
    private init() {}
}
