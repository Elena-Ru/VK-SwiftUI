//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    var body: some View {
        NavigationView {
            List(friends) { friend in
                NavigationLink {
                    FriendPhotos()
                } label: {
                    FriendsRow(friend: friend)
                }
                
            }
            .navigationTitle("Friends")
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
