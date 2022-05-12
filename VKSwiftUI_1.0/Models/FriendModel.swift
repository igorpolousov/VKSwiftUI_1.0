//
//  FriendModel.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import Foundation
import Combine

// Массив данных полученных из JSON
var friends = [Friend]()

// MARK: - Welcome
struct FriendsContainer: Codable {
    let response: FriendsResponse
}

// MARK: - Response
struct FriendsResponse: Codable {
    let items: [Friend]
}

// MARK: - Friend
struct Friend: Codable,Hashable {
    let id: Double
    let lastName: String
    let photo50: String
    let firstName: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_200_orig"
        case firstName = "first_name"
    }
}

let friendsDemoData: [Friend] = [
    Friend(id: 1, lastName: "Крокодил", photo50: "gena", firstName: "Гена"),
    Friend(id: 2, lastName: "Знатный", photo50: "chebu", firstName: "Чебурашка"),
    Friend(id: 3, lastName: "Пух", photo50: "vinni", firstName: "Винни")
]
