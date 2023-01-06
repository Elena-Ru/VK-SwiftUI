//
//  FriendsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendsList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredFriends: [Friend] {
        modelData.friends.filter { friend in
            (!showFavoritesOnly || friend.isFavorite)
        }
        .sorted { $0.lastName.first! < $1.lastName.first!}
    }
    
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
                    Section(header: Text(String(letter.uppercased()))
                                        .foregroundColor(Color(hex: "#244469"))
                                        .font(.headline)
                                        .bold()
                                        .offset(x: 30)
                                        .padding(.bottom, 0)
                                        .padding(.top, -20)) {
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
        .ignoresSafeArea()
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
            .environmentObject(ModelData())
    }
}
