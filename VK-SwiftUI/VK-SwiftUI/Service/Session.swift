//
//  Session.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import Foundation
class Session{
    
    static let shared = Session()
    
    private init(){}
    
    var token: String = ""
    var userID: Int = 1
    var userName: String = ""
}
