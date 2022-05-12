//
//  NewsDescriptionAndImageView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 12.05.2022.
//

import SwiftUI

struct NewsDescriptionAndImage: View {
    
    var newsImage: String
    var newsText: String
    
    var body: some View {
        VStack {
            Image(newsImage)
                .resizable()
                .frame(width: 290, height: 200, alignment: .topLeading)
                .padding()
            Text(newsText).font(.system(size: 12))
                .frame(width: 290, height: 170, alignment: .topLeading)
            
        }
        .padding(.leading, 0)
    }
}


