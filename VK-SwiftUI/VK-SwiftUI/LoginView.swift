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
@State var isDisabled = true

    
private let keyboardIsOnPublisher = Publishers.Merge(
    NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true },
    NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in false }
)
.removeDuplicates()
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack {
                    LogoImage()
                }
                .frame(height: UIScreen.main.bounds.height * 0.4)
                
                VStack {
                    LoginTextField(username: $login)
                    PasswordTextField(password: $password)
                    Spacer(minLength: 30)
                    if authenticationDidFail && ( login != "" || password != "") {
                        LoginFailedText()
                    }
                    LoginButton(login: $login,
                                password: $password,
                                authenticationDidSucceed: $authenticationDidSucceed,
                                authenticationDidFail: $authenticationDidFail)
                }
                .frame(maxWidth: 280, maxHeight: UIScreen.main.bounds.height * 0.5)
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
        LoginView()
    }
}
