//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI

struct FriendsRow: View {
    @EnvironmentObject var modelData: ModelData
    var friend: Friend
    
    var friendIndex: Int {
           modelData.friends.firstIndex(where: { $0.id == friend.id })!
       }
    
    var body: some View {
        HStack (spacing: 30){
            Avatar(avatar: $modelData.friends[friendIndex].photo100)
            VStack (alignment: .leading) {
                NameBoldText(name: $modelData.friends[friendIndex].fullName)
                Secondary2lineText(text: $modelData.friends[friendIndex].education)
            }
            Spacer()
            FavoriteButton(isSet: $modelData.friends[friendIndex].isFavorite)
        }
        .padding()
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var friends = ModelData().friends
    static var previews: some View {
       FriendsRow(friend: friends[0])
            .environmentObject(ModelData())
    }
}


