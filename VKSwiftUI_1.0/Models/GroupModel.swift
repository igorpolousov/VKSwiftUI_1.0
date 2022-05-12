//
//  GroupModel.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import Foundation
import Combine

struct GroupItems: Codable {
     var items: [Group]
 }

 struct Group: Codable, Hashable {
     var id: Double
     var screenName: String
     var photo: String

     enum CodingKeys: String, CodingKey {
         case id
         case screenName = "screen_name"
         case photo = "photo_50"
     }
 }

let groupsDemoData: [Group] = [
    Group(id: 1, screenName: "WTI", photo: "wti"),
    Group(id: 2, screenName: "Moto", photo: "moto"),
    Group(id: 3, screenName: "Dollars", photo: "dollars")
]
