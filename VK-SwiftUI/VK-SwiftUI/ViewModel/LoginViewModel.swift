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
    let session = Session.shared
    
    func logOut() {
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0)) {
            self.isLogin = false
            UserDefaults.standard.set(false, forKey: "isLogin")
            self.session.token = ""
            self.session.userID = 1
        }
    }
}
