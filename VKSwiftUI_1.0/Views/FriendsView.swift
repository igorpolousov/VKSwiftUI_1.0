//
//  FriendsView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//


// MARK: TO-DO
// Исправить надписи в navigation title так чтобы название соотвествовало вкладке на tab bar
import SwiftUI


struct FriendsView: View {
   
    @StateObject private var fetcher = DataFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.friendsFetched, id: \.self) { friend in
                    HStack {
                        URLImage(urlString: friend.photo50,data: nil)
    
                        Text("\(friend.firstName) \(friend.lastName)")
                    }
                }
            }
            .navigationTitle("Friends")
            .onAppear {
                fetcher.fetchFriends()
            }
        }
    }
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

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
