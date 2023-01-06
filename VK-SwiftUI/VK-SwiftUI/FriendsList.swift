//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    
    var filteredFriends: [Friend] {
        modelData.friends.filter { friend in
            (!showFavoritesOnly || friend.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                        .font(.subheadline)
                }
                ForEach(filteredFriends) { friend in
                    NavigationLink {
                        FriendPhotos(friend: friend)
                    } label: {
                        FriendsRow(friend: friend)
                    }
                    
                }
            }
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
        }
        .ignoresSafeArea()
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
            .environmentObject(ModelData())
    }
}
