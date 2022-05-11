//
//  GroupsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI
import Combine

struct GroupsView: View {
    
    var body: some View {
        List(groupsDemoData.sorted(by: {$0.screenName < $1.screenName})) { group in
            HStack {
                Image("\(group.photo)")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
                Text("\(group.screenName)")
            }
            .navigationTitle("Groups")
        }
    }
}


struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
