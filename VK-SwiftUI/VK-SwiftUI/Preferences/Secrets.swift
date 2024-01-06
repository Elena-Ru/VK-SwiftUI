//
//  Secrets.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

import Foundation

struct Secrets {
    static var clientID: String {
        getSecret(key: "ClientID")
    }

    static var clientSecret: String {
        getSecret(key: "ClientSecret")
    }
  
  	static var scope: String {
  	    getSecret(key: "Scope")
  	}
  
  	static var redirectURI: String {
  	    getSecret(key: "RedirectURI")
  	}
    
    static var version: String {
        getSecret(key: "Version")
    }
  
    private static func getSecret(key: String) -> String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let value = plist.object(forKey: key) as? String else {
                  fatalError("Couldn't find key \(key) in Config.plist.")
              }
        return value
    }
}
