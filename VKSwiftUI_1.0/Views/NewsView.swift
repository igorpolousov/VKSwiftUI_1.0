//
//  NewsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI
import Combine

struct NewsView: View {
    var body: some View {
        VStack {
            AvatarNameDate()
            NewsDescriptionAndImage()
        }
        .border(.gray, width: 0.8)
        .cornerRadius(2)
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

    struct AvatarNameDate: View {
        var body: some View {
            HStack {
                Image("wti")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
                VStack {
                    Text("User name")
                    Text("News Date")
                }
            }
            .frame(width: 320, height: 50, alignment: .topLeading)
            .padding(.leading, 5)
        }
    }
    
    struct NewsDescriptionAndImage: View {
        var body: some View {
            VStack {
                Image("dollars")
                    .resizable()
                    .frame(width: 320, height: 200, alignment: .topLeading)
                    .padding()
                Text("Here you'll see news text")
                    .frame(width: 320, height: 200, alignment: .topLeading)
                    
            }
            .padding(.leading, 20)
        }
    }
}

