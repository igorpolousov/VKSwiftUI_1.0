//
//  LoginView.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrectCredentialsAlert: Bool = false
    @Binding var isUserLoggedIn: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map {_ in true},
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map {_ in false}
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("swift")
                    .resizable()
                    .ignoresSafeArea(.all)
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VK APP Swift UI")
                            .font(.largeTitle)
                            .padding(.top, 32)
                    }
                    VStack {
                        HStack{
                            Text("Login:")
                            Spacer()
                            TextField("",text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Password:")
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                } . frame(maxWidth: 250)
                    .padding(.top, 50)
                
                Button(action: verifyLoginData) {
                    Text("Login")
                }
                .padding(.top, 50)
                .padding(.bottom, 20)
                .disabled(login.isEmpty || password.isEmpty)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(isPresented: $showIncorrectCredentialsAlert) {
            Alert(title: Text("Error"), message: Text("Wrong Credentials"), dismissButton: .cancel(Text("okay")))
        }
    }
    
    private func verifyLoginData() {
        if login == "Login" && password == "1" {
            isUserLoggedIn = true
        } else {
            showIncorrectCredentialsAlert = true
        }
        password = ""
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isUserLoggedIn: .constant(false))
            .previewInterfaceOrientation(.portrait)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
