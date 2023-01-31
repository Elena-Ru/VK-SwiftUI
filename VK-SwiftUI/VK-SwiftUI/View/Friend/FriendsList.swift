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
    @State private var showFavoritesOnly = false
    @State var filteredFriends : [Friend] = []
    @State var isListEmpty = false
    let session = Session.shared
    
    var firstLetterArray: [Character] {
        var firstLetterAr : [Character] = []
        for i in 0..<filteredFriends.count {
            guard !firstLetterAr.contains(filteredFriends[i].lastName.first!) else {
                continue
            }
            firstLetterAr.append(filteredFriends[i].lastName.first!)
        }
        return firstLetterAr
    }
    
    
    var body: some View {
        contentView
    }
    var contentView: some View {
        NavigationView {
            ZStack {
                if isListEmpty {
                    EmptyFriendsListView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    listView
                }
            }
        }
        .onAppear{
            getFriends()
        }
        .ignoresSafeArea()
    }
    
    var listView: some View {
        List {
            toggle
            ForEach(firstLetterArray, id: \.self) { letter in
                Section(header: SectionTitle(title: letter)) {
                     ForEach(filteredFriends.filter({ friend in
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
        Toggle(isOn: $showFavoritesOnly) {
            Text("Favorites only")
                .font(.subheadline)
        }
        .onChange(of: showFavoritesOnly) { value in
            updateFriends()
            }
    }
    
    private func getFriends() {
        friendsViewModel.getFriendsList(token: session.token, id: session.userID) { items in
            self.filteredFriends = items.sorted { $0.lastName.first! < $1.lastName.first!}
            if self.filteredFriends.isEmpty {
                isListEmpty = true
            }
        }
    }
    
    private func updateFriends() {
        friendsViewModel.getFriendsList(token: session.token, id: session.userID) { items in
                self.filteredFriends = items.filter { friend in
                    (!showFavoritesOnly || friend.isFavorite)
                }
                .sorted { $0.lastName.first! < $1.lastName.first!}
            }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
            .environmentObject(FriendsViewModel())
    }
}



