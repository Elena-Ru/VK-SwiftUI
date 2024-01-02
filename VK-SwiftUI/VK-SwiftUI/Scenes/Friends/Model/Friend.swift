//
//  User.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.05.2023.
//

// MARK: - Friend
struct Friend {
  	var id: Int
  	var photo100: String?
  	var firstName: String
  	var lastName: String
  	var fullName: String
  	var isRealm: Bool
  	var isFavorite: Bool
  	var photos : [RLMPhoto]?
}
