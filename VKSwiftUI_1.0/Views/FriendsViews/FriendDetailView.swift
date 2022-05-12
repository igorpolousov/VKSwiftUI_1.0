//
//  FriendDetailView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct FriendDetailView: View {
    
    var friend: Friend
    
    var body: some View {
        
        VStack {
            URLImageBig(urlString: friend.photo50)
        }
        .padding(.bottom, 230)
        .navigationTitle("Friend photo")
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: friendsDemoData.first!)
    }
}
