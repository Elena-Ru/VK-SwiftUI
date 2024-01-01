//
//  LoginViewWK.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import SwiftUI

extension View {
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}

struct LoginViewWK: View {
    @ObservedObject var networkMonitor =  NetworkMonitor()
    @StateObject var loginVM = LoginViewModel()
    @State private var showLoading = false
    
    var body: some View {
        if networkMonitor.isConnected {
            if loginVM.isLogin{
                MainView()
                    .environmentObject(loginVM)
            } else {
               LoginWebView(showLoading: $showLoading, isLogin: $loginVM.isLogin)
                    .environmentObject(loginVM)
                    .onAppear(){
                       cleanRealm()
                    }
            }
        } else {
            NoNetworkView()
        }
    }
    
    func cleanRealm() {
        let log = UserDefaults.standard.bool(forKey: "isLogin")
        if  !log {
            RealmService().deleteAll()
        }
    }
}
