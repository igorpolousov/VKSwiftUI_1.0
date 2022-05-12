//
//  GroupModel.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import Foundation
import Combine

struct GroupContainer: Codable {
    let response: GroupResponse
}

// MARK: - Response
struct GroupResponse: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable,Hashable {
    let photo100: String
    let screenName: String
    

    enum CodingKeys: String, CodingKey {
        case photo100 = "photo_100"
        case screenName = "screen_name"
    }
}


//let groupsDemoData: [Group] = [
//    Group(id: 1, screenName: "WTI", photo: "wti"),
//    Group(id: 2, screenName: "Moto", photo: "moto"),
//    Group(id: 3, screenName: "Dollars", photo: "dollars")
//]
