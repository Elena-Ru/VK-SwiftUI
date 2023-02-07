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
    @Published var isLogin = false
    let session = Session.shared
    
    func logOut() {
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0)) {
            self.isLogin = false
            self.session.token = ""
            self.session.userID = 1
        }
    }
}
