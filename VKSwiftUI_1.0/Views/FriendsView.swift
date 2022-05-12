//
//  FriendsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI


struct FriendsView: View {
   
    @StateObject private var fetcher = DataFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.friendsFetched, id: \.self) { friend in
                    HStack {
                        Image("")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                            .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
                            .onAppear {
                                
                            }
                        Text("\(friend.firstName) \(friend.lastName)")
                    }
                }
            }
            .navigationTitle("Friends")
            .onAppear {
                fetcher.fetchFriends()
            }
        }
    }
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
