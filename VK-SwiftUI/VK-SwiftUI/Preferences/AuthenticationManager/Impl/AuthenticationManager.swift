//
//  AuthenticationManager.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

import Foundation

// MARK: - AuthenticationManager
final class AuthenticationManager: AuthenticationManagerInterface {
    
    // MARK: Static
    static let shared = AuthenticationManager()

    // MARK: Properties
    let keychainManager: KeychainManagerInterface
    
    // MARK: Initializer
    init() {
        self.keychainManager = KeychainManager()
    }
    
    // MARK: Properties
    var accessToken: String? {
        if let data = self.keychainManager.read(service: Constants.accessTokenKey, account: Constants.accountKey) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    var clientID: String? {
        if let data = self.keychainManager.read(service: Constants.clientIDKey, account: Constants.accountKey) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    // MARK: Methods
    func setAccessToken(token: String) {
        self.keychainManager.save(
            data: Data(token.utf8),
            service: Constants.accessTokenKey,
            account: Constants.accountKey)
    }
  
    func clearAccessToken() {
            keychainManager.delete(
            service: Constants.accessTokenKey,
            account: Constants.accountKey)
    }
    
    func setClientID(id: String) {
        self.keychainManager.save(
            data: Data(id.utf8),
            service: Constants.clientIDKey,
            account: Constants.accountKey)
    }
}

// MARK: - Constants
private extension AuthenticationManager {
  	enum Constants {
  	    static let accessTokenKey = "access_token"
  	    static let clientIDKey = "client_id"
  	    static let accountKey = "vkClient"
  	}
}
