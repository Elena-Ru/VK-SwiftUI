//
//  PasswordTextField.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(password: .constant(""))
    }
}
