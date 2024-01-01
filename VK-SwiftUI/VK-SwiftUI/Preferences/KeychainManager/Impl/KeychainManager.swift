//
//  KeychainManager.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

import Foundation

// MARK: - KeychainManager
class KeychainManager: KeychainManagerInterface {
    func save(data: Data, service: String, account: String) {
        let accessTokenQuery = [
            kSecValueData: data,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked
        ] as CFDictionary
        
        let status = SecItemAdd(accessTokenQuery, nil)
        
        if status == errSecDuplicateItem {
            
            let query = [
                kSecValueData: data,
                kSecAttrService: service,
                kSecAttrAccount: account,
                kSecClass: kSecClassGenericPassword,
                kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked
            ] as CFDictionary
            
            let attributesToUpdate = [kSecValueData: data] as CFDictionary
            
            SecItemUpdate(query, attributesToUpdate)
        }
    }
    
    func read(service: String, account: String) -> Data? {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    func delete(service: String, account: String) {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ]
    }
    
    //MARK: Initializer
    init() {
        
    }
}

