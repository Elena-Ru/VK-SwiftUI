//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import RealmSwift

struct FriendsList: View {
    @ObservedObject var friendsViewModel = FriendsViewModel()
    @EnvironmentObject var loginVM : LoginViewModel
    @ObservedResults(RLMFriend.self) var friends
    
    var body: some View {
        contentView
    }
    var contentView: some View {
        NavigationView {
            ZStack {
                if friendsViewModel.isListEmpty || friends.isEmpty {
                    EmptyFriendsListView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    listView
                }
            }
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        loginVM.logOut()
                    }, label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .rotationEffect(.degrees(180))
                            .foregroundColor(Color.theme.control)
                        
                    }
                    )
                })
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
                    ForEach(friends.filter({ friend in
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
            .onDelete(perform: delete)
        }
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
    
    func delete(at offsets: IndexSet) {
        let index = offsets[offsets.startIndex]
        friendsViewModel.deleteFriend(friendId: friends[index].id)
        $friends.remove(atOffsets: offsets)
        friendsViewModel.updateFriends()
    }
}





