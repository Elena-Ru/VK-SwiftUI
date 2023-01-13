//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI


struct FriendsRow: View {
    @ObservedObject var friendsViewModel = FriendsViewModel()
    @State var friend: Friend
    
    var body: some View {
        HStack{
            Avatar(avatar: $friend.photo100)
            VStack (alignment: .leading) {
                NameBoldText(name: $friend.fullName)
                //Secondary2lineText(text: $modelData.friends[friendIndex].universityName)
            }
            .padding(.leading, 20)
            Spacer()
            FavoriteButton(isSet: $friend.isFavorite)
        }
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var friends = FriendsViewModel().friends
    static var previews: some View {
       FriendsRow(friend: friends[0])
            .environmentObject(FriendsViewModel())
    }
}


