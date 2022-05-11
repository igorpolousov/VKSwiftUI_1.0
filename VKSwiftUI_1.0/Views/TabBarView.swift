//
//  TabBarView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI
import Combine

struct TabBarView: View {
    var body: some View {
        TabView {
            FriendsView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Friends")
                }
            GroupsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Groups")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "tray.2")
                    Text("News")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
