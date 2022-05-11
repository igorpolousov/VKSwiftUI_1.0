//
//  NewsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI
import Combine

struct NewsView: View {
    var body: some View {
        
        List(news.sorted(by: {$0.newsDate < $1.newsDate})) { newsItem in
            VStack {
                AvatarNameDate(avatarImage: newsItem.userImage, userName: newsItem.userName, newsDate: newsItem.newsDate)
                    .padding(.top, 8)
                NewsDescriptionAndImage(newsImage: newsItem.newsImage, newsText: newsItem.newsText)
            }
            .border(.gray, width: 0.8)
            .cornerRadius(2)
            
        }
        .navigationTitle("News feed")
    }




    struct AvatarNameDate: View {
        
        var avatarImage: String
        var userName: String
        var newsDate:String
        
        var body: some View {
            HStack {
                Image(avatarImage)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
                VStack {
                    Text(userName).font(.system(size: 16))
                    Text(newsDate).font(.system(size: 16))
                }
            }
            .frame(width: 290, height: 30, alignment: .topLeading)
        }
    }
    
    struct NewsDescriptionAndImage: View {
        
        var newsImage: String
        var newsText: String
        
        var body: some View {
            VStack {
                Image(newsImage)
                    .resizable()
                    .frame(width: 290, height: 200, alignment: .topLeading)
                    .padding()
                Text(newsText).font(.system(size: 12))
                    .frame(width: 290, height: 170, alignment: .topLeading)
                    
            }
            .padding(.leading, 0)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
