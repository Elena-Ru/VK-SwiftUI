//
//  ContentView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI
import Combine

let storedUsername = "1"
let storedPassword = "1"

struct LoginView: View {
    
@State private var login = ""
@State private var password = ""
@State var authenticationDidFail: Bool = false
@State var authenticationDidSucceed: Bool = false
@Binding var isUserLoggedIn: Bool

private let keyboardIsOnPublisher = Publishers.Merge(
    NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true },
    NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in false }
)
.removeDuplicates()
    
    var body: some View {
        GeometryReader { geometry in
         
            ZStack{
                HStack{
                   Spacer()
                   Spacer()
                }
                ScrollView(showsIndicators: false) {
                    LogoImage()
                        .frame(width:geometry.size.width * 0.4, height: geometry.size.height * 0.4)
                 
                    VStack {
                        LoginTextField(username: $login)
                        PasswordTextField(password: $password)
                        Spacer(minLength: 30)
                        LoginButton(login: $login,
                                    password: $password,
                                    authenticationDidSucceed: $authenticationDidSucceed,
                                    authenticationDidFail: $authenticationDidFail,
                                    isLoggedIn: $isUserLoggedIn)
                    }
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.5)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                if authenticationDidSucceed {
                    LoginSucceedView()
                }
            }
            .background(
                BackgroundImage()
            )
            .ignoresSafeArea()
        }
    }
}

extension UIApplication {
    func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:
    nil, for: nil)
    }
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView( isUserLoggedIn: .constant(false))
    }
}
    
