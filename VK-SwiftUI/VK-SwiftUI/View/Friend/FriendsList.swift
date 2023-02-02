//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    @EnvironmentObject var modelData:  LoginViewModel
    @ObservedObject var friendsViewModel = FriendsViewModel()
    
    var body: some View {
        contentView
    }
    var contentView: some View {
        NavigationView {
            ZStack {
                if friendsViewModel.isListEmpty {
                    EmptyFriendsListView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    listView
                }
            }
        }
        .onAppear{
            friendsViewModel.getFriends()
        }
        .ignoresSafeArea()
    }
    
    var listView: some View {
        List {
            toggle
            ForEach(friendsViewModel.firstLetterArray, id: \.self) { letter in
                Section(header: SectionTitle(title: letter)) {
                    ForEach(friendsViewModel.filteredFriends.filter({ friend in
                         friend.lastName.first?.lowercased() == letter.lowercased()})) { friend in
                         NavigationLink {
                                 FriendPhotos(friend: friend)
                         }
                         label: {
                             FriendsRow(friendsViewModel: friendsViewModel, friend: friend)
                        }
                         .disabled(friend.photo100 == "https://vk.com/images/camera_100.png")
                         
                     }
                 }
             }
        }
        .navigationTitle("Friends")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var toggle: some View {
        Toggle(isOn: $friendsViewModel.showFavoritesOnly) {
            Text("Favorites only")
                .font(.subheadline)
        }
        .onChange(of: friendsViewModel.showFavoritesOnly) { value in
            friendsViewModel.updateFriends()
            }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
            .environmentObject(FriendsViewModel())
    }
}



