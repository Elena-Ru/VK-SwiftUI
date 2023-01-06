//
//  LoginButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI
import AlertX

struct LoginButton: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var authenticationDidSucceed: Bool
    @Binding var authenticationDidFail: Bool
    @Binding var isLoggedIn: Bool
   private var isDisabled: Bool { login.isEmpty || password.isEmpty }
    
    fileprivate func verifyLoginData() {
        if login == storedUsername
            && password == storedPassword {
            isLoggedIn = true
            //authenticationDidSucceed.toggle()
        } else {
            authenticationDidFail.toggle()
        }
    }
    
    var body: some View {
        Button {
            verifyLoginData()
        } label: {
            Text("Login")
                .frame(width: 160, height: 40)
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .buttonStyle(LoginButtonStyle(disabled: self.isDisabled))
        .disabled(login.isEmpty || password.isEmpty)
        .alertX(isPresented: $authenticationDidFail, content: {
              AlertX(title: Text("Information not correct. Try again."),
                     theme: .cherry(withTransparency: true, roundedCorners: true),
                     animation: .fadeEffect())
        })
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(login: .constant(""),
                    password: .constant(""),
                    authenticationDidSucceed: .constant(false),
                    authenticationDidFail: .constant(false),
                    isLoggedIn: .constant(false)
        )
    }
}
