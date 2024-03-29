//
//  NewsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var fetcher = DataFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.newsFetchedGroups,  id:\.self) { newsItem in
                    HStack {
                        URLImage(urlString: newsItem.photo50)
                        VStack {
                            Text(newsItem.screenName)
                        }
                    }
                }
            }
            .navigationTitle("News")
            .onAppear {
                fetcher.fetchNews()
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
