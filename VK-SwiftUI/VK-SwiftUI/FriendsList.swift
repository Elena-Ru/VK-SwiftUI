//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    @State private var showFavoritesOnly = true
    
    var filteredFriends: [Friend] {
        friends.filter { friend in
            (!showFavoritesOnly || friend.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredFriends) { friend in
                NavigationLink {
                    FriendPhotos(friend: friend)
                } label: {
                    FriendsRow(friend: friend)
                }
                
            }
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
