//
//  FriendsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//


// MARK: TO-DO
// Исправить надписи в navigation title так чтобы название соотвествовало вкладке на tab bar
import SwiftUI


struct FriendsView: View {
   
    @StateObject private var fetcher = DataFetcher()
    @CaseModifier(wrappedValue: "Friends Property Wrapper", chooseCodingCase: .camelCase)  var camelText: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.friendsFetched, id: \.self) { friend in
                    NavigationLink(destination: FriendDetailView(friend: friend)) {
                        HStack {
                            URLImage(urlString: friend.photo50,data: nil)
        
                            Text("\(friend.firstName) \(friend.lastName)")
                        }
                    }
                }
            }
            .navigationTitle(camelText)
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


