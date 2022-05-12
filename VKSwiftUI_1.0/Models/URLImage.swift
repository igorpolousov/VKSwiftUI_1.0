//
//  URLImage.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 12.05.2022.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
        } else {
            Image("donald")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 4))
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
