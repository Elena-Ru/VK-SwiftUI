//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI
import RealmSwift //1

struct FriendsRow: View {
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
                //Secondary2lineText(text: $modelData.friends[friendIndex].universityName)
            }
            .padding(.leading, 20)
            Spacer()
            FavoriteButton(friend: friend)
        }
    }
}
