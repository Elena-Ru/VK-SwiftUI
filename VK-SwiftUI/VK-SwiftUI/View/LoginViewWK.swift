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
//                    .overlay(showLoading ? ProgressView("LOADING...").toAnyView() : EmptyView().toAnyView())
            }
        } else {
            NoNetworkView()
        }
    }
}

//struct LoginViewWK_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginViewWK()
//            .environmentObject(LoginViewModel())
//    }
//}
