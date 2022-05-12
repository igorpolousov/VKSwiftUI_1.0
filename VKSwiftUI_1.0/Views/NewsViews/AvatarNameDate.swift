//
//  AvatarNameDate.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 12.05.2022.
//

import SwiftUI

struct AvatarNameDate: View {
    
    var avatarImage: String
    var userName: String
    var newsDate:String
    
    var body: some View {
        HStack {
            URLImage(urlString: <#T##String#>)
            VStack {
                Text(userName).font(.system(size: 16))
                Text(newsDate).font(.system(size: 16))
            }
        }
        .frame(width: 290, height: 30, alignment: .topLeading)
    }
}
