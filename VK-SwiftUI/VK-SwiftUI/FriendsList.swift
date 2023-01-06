//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    var body: some View {
        List {
            FriendsRow(friend: friends[0])
            FriendsRow(friend: friends[1])
            FriendsRow(friend: friends[2])
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
