//
//  FavoriteButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct FavoriteButton: View {
 
    @EnvironmentObject var friendsVM : FriendsViewModel
     var friend: RLMFriend
    
    var body: some View {
        
        Button {
            RealmService.shared.isFavorite(friend: friend)
        } label: {
            Label("Toggle Favorite", systemImage: friend.isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(friend.isFavorite ? .yellow : .gray)
                .padding(10)
        }
        .buttonStyle(.borderless)
    }
}
