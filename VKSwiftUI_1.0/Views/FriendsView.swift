//
//  FriendsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct FriendsView: View {
    
    var body: some View {
        List(friends.sorted(by: {$0.firstName < $1.firstName})) { friend in
            Text("\(friend.firstName) \(friend.lastName)")
        }
        .navigationTitle("Friends")
    }
}



struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
