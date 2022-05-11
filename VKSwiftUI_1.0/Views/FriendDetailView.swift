//
//  FriendDetailView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI

struct FriendDetailView: View {
    var body: some View {
        Image("gena")
            .resizable()
            .frame(width: 300, height: 400, alignment: .center)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 10, x: 10, y: 10)

    }
}


struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView()
    }
}
