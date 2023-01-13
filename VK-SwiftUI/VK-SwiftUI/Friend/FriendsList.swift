//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    @EnvironmentObject var modelData:  ModelData
    @ObservedObject var friendsViewModel = FriendsViewModel()
    @State private var showFavoritesOnly = false
    @State var filteredFriends = [Friend]()
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
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                        .font(.subheadline)
                }
                ForEach(firstLetterArray, id: \.self) { letter in
                    Section(header: SectionTitle(title: letter)) {
                         ForEach(filteredFriends.filter({ friend in
                             friend.lastName.first?.lowercased() == letter.lowercased()})) { friend in
                             NavigationLink {
                                 FriendPhotos(friend: friend)
                             } label: {
                                FriendsRow(friend: friend)
                            }
                         }
                     }
                 }
            }
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            friendsViewModel.getFriendsList(token: session.token, id: session.userID) { items in
                filteredFriends = items.filter { friend in
                    (!showFavoritesOnly || friend.isFavorite)
                }
                .sorted { $0.lastName.first! < $1.lastName.first!}
                modelData.friends = items
                print(filteredFriends)
            }
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


