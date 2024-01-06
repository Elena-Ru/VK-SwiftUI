//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import RealmSwift

// MARK: - FriendsList
struct FriendsList: View {
    // MARK: Properties
    @ObservedObject var friendsViewModel = FriendsViewModel()
    @EnvironmentObject var loginVM: LoginViewModel
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
            .navigationTitle(Texts.Shared.friends)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        DispatchQueue.main.async {
                          loginVM.logOut()
                        }
                    }, label: {
                        Image(systemName: Constants.logoutIcon)
                            .rotationEffect(.degrees(Constants.rotationDegree))
                            .foregroundColor(Color.theme.control)
                    })
                })
            }
        }
        .onAppear {
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
                         .disabled(friend.photo100 == Constants.friendDefaultIcon )
                     }
                 }
             }
            .onDelete(perform: delete)
        }
    }
    
    var toggle: some View {
        Toggle(isOn: $friendsViewModel.showFavoritesOnly) {
          Text(Texts.FriendsVC.favoritesOnly)
              .font(.subheadline)
        }
        .onChange(of: friendsViewModel.showFavoritesOnly) { _ in
            friendsViewModel.updateFriends()
        }
    }
}

// MARK: - Private methods
private extension FriendsList {
  	func delete(at offsets: IndexSet) {
  	    let index = offsets[offsets.startIndex]
  	    friendsViewModel.deleteFriend(friendId: friends[index].id)
  	    $friends.remove(atOffsets: offsets)
  	    friendsViewModel.updateFriends()
  	}
}

// MARK: - Constants
private extension FriendsList {
    enum Constants {
        static let logoutIcon: String = "rectangle.portrait.and.arrow.forward"
        static let friendDefaultIcon: String = "https://vk.com/images/camera_100.png"
        static let rotationDegree: CGFloat = 180
    }
}
