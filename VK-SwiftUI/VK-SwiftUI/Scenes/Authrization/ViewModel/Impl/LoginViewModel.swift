//
//  LoginViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.02.2023.
//

import Foundation
import SwiftUI
import WebKit

// MARK: - LoginViewModel
final class LoginViewModel: ObservableObject {
    
    // MARK: Properties
    private let userDefaults: UserDefaults
    private let websiteDataStore: WKWebsiteDataStore
    private let authenticationManager: AuthenticationManager
    
    @Published var isLogin: Bool
    
    // MARK: Initializer
    init(
      	userDefaults: UserDefaults = .standard,
      	websiteDataStore: WKWebsiteDataStore = .default(),
      	authenticationManager: AuthenticationManager = .shared
    ) {
      	self.userDefaults = userDefaults
      	self.websiteDataStore = websiteDataStore
      	self.authenticationManager = authenticationManager
      	isLogin = userDefaults.bool(forKey: UserDefaults.Keys.isLogin)
    }
}

// MARK: - Private Methods
extension LoginViewModel: LoginViewModelInterface {
  	func logOut() {
  	  	clearWebsiteData {
  	  	  self.updateLoginState(isLoggedIn: false)
  	  	  self.authenticationManager.clearAccessToken()
  	  	  self.authenticationManager.setClientID(id: Constants.defaultClientID)
  	  	}
  	}
}

// MARK: - Private Methods
private extension LoginViewModel {
  	private func clearWebsiteData(completion: @escaping () -> Void) {
  	  	websiteDataStore.removeData(
  	  	  ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
  	  	  modifiedSince: Date(timeIntervalSince1970: .zero),
  	  	  completionHandler: completion)
  	}
  	
  	private func updateLoginState(isLoggedIn: Bool) {
  	  	isLogin = isLoggedIn
  	  	userDefaults.set(isLoggedIn, forKey: UserDefaults.Keys.isLogin)
  	}
}

// MARK: - Constants
private extension LoginViewModel {
  	enum Constants {
  	  static let defaultClientID: String = "1"
  	}
}
