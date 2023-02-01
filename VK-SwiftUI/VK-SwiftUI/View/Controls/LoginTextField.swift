//
//  LoginTextField.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

struct LoginTextField: View {
    @Binding var username: String
    var body: some View {
        HStack {
            Image(systemName: "person")
                .foregroundColor(.gray)
            TextField("Login", text: $username)
        }
         .padding()
         .background(Color(.secondarySystemBackground))
         .cornerRadius(16)
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(username: .constant(""))
    }
}
