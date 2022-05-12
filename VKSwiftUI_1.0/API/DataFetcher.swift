//
//  APIRequest.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//


import UIKit

class friendsDataFetcher: ObservableObject {
    
    var urlComponents = URLComponents()
    let session = URLSession.shared
    
    func fetchFriends() -> [Friend] {
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_ids", value: AuthSession.shared.userId),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "city, photo_200_orig"),
            URLQueryItem(name: "access_token", value: AuthSession.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        let url = urlComponents.url!
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(FriendsContainer.self, from: data) {
                friends = jsonData.response.items
            }
        }
        return friends
    }
  
    
}
