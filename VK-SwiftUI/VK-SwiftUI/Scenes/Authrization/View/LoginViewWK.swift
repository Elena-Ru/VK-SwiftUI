//
//  LoginViewWK.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import SwiftUI

// MARK: - LoginViewWK
struct LoginViewWK: View {
    var networkMonitor = NetworkMonitor()
    @StateObject var loginVM = LoginViewModel()
    @State private var showLoading = false
    
    var body: some View {
        if networkMonitor.isConnected {
            if loginVM.isLogin {
               MainView()
                    .environmentObject(loginVM)
            } else {
               LoginWebView(showLoading: $showLoading, isLogin: $loginVM.isLogin)
                    .environmentObject(loginVM)
                    .onAppear() {
                       cleanRealm()
                    }
            }
        } else {
            NoNetworkView()
        }
    }
}

// MARK: - Private Methods
private extension LoginViewWK {
  	func cleanRealm() {
        let log = UserDefaults.standard.bool(forKey: UserDefaults.Keys.isLogin)
  	    if  !log {
  	        RealmService().deleteAll()
  	    }
  	}
}
