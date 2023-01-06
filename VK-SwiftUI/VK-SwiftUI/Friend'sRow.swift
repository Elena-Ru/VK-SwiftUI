//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI

struct FriendsRow: View {
    @State var friend: Friend
    
    var body: some View {
        HStack (spacing: 30){
            Avatar(avatar: $friend.photo100)
            VStack (alignment: .leading) {
                NameBoldText(name: $friend.fullName)
                Secondary2lineText(text: $friend.education)
            }
            Spacer()
            FavoriteButton(isSet: $friend.isFavorite)
        }
        .padding()
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var previews: some View {
            FriendsRow(friend: friends[0])
    }
}


