//
//  LoginViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.02.2023.
//

import Foundation
import SwiftUI
import WebKit

class LoginViewModel: ObservableObject {

    @Published var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    
    func logOut() {
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0)) {
            self.isLogin = false
            UserDefaults.standard.set(false, forKey: "isLogin")
            UserDefaults.standard.set("", forKey: "token")
            UserDefaults.standard.set(1, forKey: "userID")
        }
    }
}
