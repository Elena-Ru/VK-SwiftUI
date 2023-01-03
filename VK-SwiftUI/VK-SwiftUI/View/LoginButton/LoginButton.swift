//
//  LoginButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI

struct LoginButton: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var authenticationDidSucceed: Bool
    @Binding var authenticationDidFail: Bool
    
    var body: some View {
        Button {
            if login == storedUsername
                && password == storedPassword {
                authenticationDidSucceed = true
                authenticationDidFail = false
            } else {
                authenticationDidFail = true
                authenticationDidSucceed = false
            }
        } label: {
            Text("Login")
                .frame(width: 160, height: 40)
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .buttonStyle(LoginButtonStyle(color: .blue))
        .disabled(login.isEmpty || password.isEmpty)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(login: .constant(""),
                    password: .constant(""),
                    authenticationDidSucceed: .constant(false),
                    authenticationDidFail: .constant(false)
        )
    }
}
