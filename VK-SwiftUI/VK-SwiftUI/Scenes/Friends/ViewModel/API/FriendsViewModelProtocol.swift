//
//  FriendsViewModelProtocol.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-02.
//

import Foundation

protocol FriendsViewModelProtocol {
    func getFriends()
    func updateFriends()
    func deleteFriend(friendId: Int)
}
