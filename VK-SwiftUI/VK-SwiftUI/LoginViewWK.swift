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
    @ObservedObject var modelData =  ModelData()
    @State private var showLoading = false
    
    var body: some View {
        if modelData.loggedIn{
            MainView()
                .environmentObject(modelData)
        } else {
            LoginWebView(showLoading: $showLoading, isLogin: $modelData.loggedIn)
                .overlay(showLoading ? ProgressView("LOADING...").toAnyView() : EmptyView().toAnyView())
        }
    }
}

struct LoginViewWK_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewWK()
            .environmentObject(ModelData())
    }
}
