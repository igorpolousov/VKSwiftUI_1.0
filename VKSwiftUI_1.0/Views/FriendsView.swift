//
//  FriendsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct FriendsView: View {
   
    
    var body: some View {
        List(friendsDemoData.sorted(by: {$0.firstName < $1.firstName})) { friend in
            NavigationLink(destination: FriendDetailView(friend: friend)) {
                HStack {
                    Image("\(friend.photo50)")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
                    Text("\(friend.firstName) \(friend.lastName)")
                }
            }
            .navigationTitle("Friends")
        }
        
    }
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
