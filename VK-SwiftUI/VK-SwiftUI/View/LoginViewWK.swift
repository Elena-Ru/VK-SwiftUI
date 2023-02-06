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
    @State private var showLoading = false
    @State var isLogin = false
    
    var body: some View {
        if networkMonitor.isConnected {
            if isLogin{
                MainView()
//                    .environmentObject(modelData)
            } else {
               LoginWebView(showLoading: $showLoading, isLogin: $isLogin)
//                    .environmentObject(modelData)
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
