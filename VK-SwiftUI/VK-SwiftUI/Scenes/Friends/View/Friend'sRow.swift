//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI
import RealmSwift

// MARK: - FriendsRow
struct FriendsRow: View {
    // MARK: Properties
    @StateObject var friendsViewModel:  FriendsViewModel
    @ObservedRealmObject var friend: RLMFriend
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        HStack{
            Avatar(avatar: $friend.photo100)
            VStack (alignment: .leading) {
                NameBoldText(name: $friend.fullName)
            }
            .padding(.leading, Constants.inset)
            Spacer()
            FavoriteButton(friend: friend)
        }
    }
}

// MARK: - Constants
private extension FriendsRow {
    enum Constants {
        static let inset: CGFloat = 20
    }
}
