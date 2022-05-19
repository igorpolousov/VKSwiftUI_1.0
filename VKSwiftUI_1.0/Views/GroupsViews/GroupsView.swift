//
//  GroupsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI
import Combine

struct GroupsView: View {
    
    @StateObject private var fetcher = DataFetcher()
    @CaseModifier(wrappedValue: "Groups Property Wrapper", chooseCodingCase: .kebabCase)  var kebabText: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.groupsFetched, id: \.self) { group in
                    HStack {
                        URLImage(urlString: group.photo100)
                        Text("\(group.screenName)")
                    }
                }
            }
            .navigationTitle(kebabText)
            .onAppear {
                fetcher.fetchGroups()
            }
        }
    }
}


struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
