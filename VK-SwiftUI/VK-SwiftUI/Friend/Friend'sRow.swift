//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendsRow: View {
    @EnvironmentObject var modelData: ModelData
    var friend: Friend
    
    var friendIndex: Int {
           modelData.friends.firstIndex(where: { $0.id == friend.id })!
       }
    
    var body: some View {
        HStack{
            Avatar(avatar: $modelData.friends[friendIndex].photo100)
            VStack (alignment: .leading) {
                NameBoldText(name: $modelData.friends[friendIndex].fullName)
                //Secondary2lineText(text: $modelData.friends[friendIndex].universityName)
            }
            .padding(.leading, 20)
            Spacer()
            FavoriteButton(isSet: $modelData.friends[friendIndex].isFavorite)
        }
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var friends = ModelData().friends
    static var previews: some View {
       FriendsRow(friend: friends[0])
            .environmentObject(ModelData())
    }
}


