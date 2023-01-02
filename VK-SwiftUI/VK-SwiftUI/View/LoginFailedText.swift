//
//  LoginFailedText.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

struct LoginFailedText: View {
    var body: some View {
        Text("Information not correct. Try again.")
            .offset(y: -10)
            .foregroundColor(.red)
    }
}

struct LoginFailedText_Previews: PreviewProvider {
    static var previews: some View {
        LoginFailedText()
    }
}
