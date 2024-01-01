//
//  AuthenticationManagerInterface.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

// MARK: - AuthenticationManagerInterface
protocol AuthenticationManagerInterface {
    var accessToken: String? { get }
    var clientID: String? { get }
    
    func setAccessToken(token: String)
    func setClientID(id: String)
    func clearAccessToken()
}
