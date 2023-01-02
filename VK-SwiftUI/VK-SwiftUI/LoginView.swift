//
//  ContentView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        ScrollView {
            VStack {
                
                GeometryReader { geometry in
                    Image("vkLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .padding(30)
                }
                
                Text("VKontakte Client")
                Spacer()
                HStack {
                    Text("Login")
                    Spacer()
                    TextField("", text: $login)
                        .frame(maxWidth: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Password")
                    Spacer()
                    SecureField("", text: $password)
                        .frame(maxWidth: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button {
                    print("Hello")
                } label: {
                    Text("Log in")
                }
                .padding(.top, 50)
                .padding(.bottom, 20)
                .disabled(login.isEmpty || password.isEmpty)
                
            }
            .frame(maxWidth: 250)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
