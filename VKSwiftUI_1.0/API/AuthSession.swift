//
//  AuthSession.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

protocol AuthDataProtocol {
    var token: String { get set }
    var userId: Int { get set }
}

final class AuthSession: AuthDataProtocol {
    var token = ""
    var userId = 0
    static let shared = AuthSession()
    private init() {}
}
