//
//  LoginSucceedView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

struct LoginSucceedView: View {
    var body: some View {
        Text("Login succeeded!")
            .font(.headline)
            .frame(width: 250, height: 80)
            .background(Color.green)
            .cornerRadius(20.0)
            .foregroundColor(.white)
    }
}

struct LoginSucceedView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSucceedView()
    }
}
