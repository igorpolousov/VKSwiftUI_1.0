//
//  URLImageDetail.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 12.05.2022.
//

import SwiftUI

struct URLImageBig: View {
    let urlString: String
    @State var data: Data?
    
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 300, height: 400, alignment: .center)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 10, x: 10, y: 10)
        } else {
            Image("donald")
                .resizable()
                .frame(width: 300, height: 400, alignment: .center)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 10, x: 10, y: 10)
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

