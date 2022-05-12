//
//  APIRequest.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//


import UIKit

class DataFetcher: ObservableObject {
    
    var urlComponents = URLComponents()
    let session = URLSession.shared
    
    @Published var friendsFetched = [Friend]()
    @Published var groupsFetched = [Group]()
    @Published var newsFetched = [NewsGroup]()
    
    // MARK: Get friends data
    func fetchFriends() {
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
                friendsFetched = jsonData.response.items
            }
        }
        return 
    }
    
    // MARK: Get groups data
    func fetchGroups() {
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_ids", value: AuthSession.shared.userId),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "extended"),
            URLQueryItem(name: "access_token", value: AuthSession.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        let url = urlComponents.url!
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(GroupContainer.self, from: data) {
                groupsFetched = jsonData.response.items
            }
        }
        return
    }
    
    
    // MARK: Get news data
    func fetchNews() {
        let startFrom = ""
        
        self.urlComponents.scheme = "https"
        self.urlComponents.host = "api.vk.com"
        self.urlComponents.path = "/method/newsfeed.get"
        self.urlComponents.queryItems = [
            URLQueryItem(name: "user_ids", value: AuthSession.shared.userId),
            //URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "filters", value: "post, photo"),
            URLQueryItem(name: "access_token", value: AuthSession.shared.token),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "start_from", value: startFrom)
        ]
        
        let url = urlComponents.url!
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(NewsContainer.self, from: data) {
                newsFetched = jsonData.response.groups
            }
        }
        return
    }
    
}
