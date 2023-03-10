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
//    @ObservedObject var loginVM = LoginViewModel()
    @EnvironmentObject var loginVM : LoginViewModel
    @ObservedResults(Friend.self) var friends
    
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

//struct FriendsList_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsList()
//            .environmentObject(FriendsViewModel())
//    }
//}



