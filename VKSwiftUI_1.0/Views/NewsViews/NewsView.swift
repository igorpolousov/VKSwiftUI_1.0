//
//  NewsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        
        List(news.sorted(by: {$0.newsDate < $1.newsDate})) { newsItem in
            VStack {
                AvatarNameDate(avatarImage: newsItem.userImage, userName: newsItem.userName, newsDate: newsItem.newsDate)
                    .padding(.top, 8)
                NewsDescriptionAndImage(newsImage: newsItem.newsImage, newsText: newsItem.newsText)
            }
            .navigationTitle("News feed")
            .border(.gray, width: 0.8)
            .cornerRadius(2)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
