//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI


struct FriendsRow: View {
    @StateObject var friendsViewModel:  FriendsViewModel
    var friend: Friend
    var friendIndex: Int {
        return friendsViewModel.friends.firstIndex(of: friend)!
          }
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        HStack{
            Avatar(avatar: $friendsViewModel.friends[friendIndex].photo100)
            VStack (alignment: .leading) {
                NameBoldText(name: $friendsViewModel.friends[friendIndex].fullName)
                //Secondary2lineText(text: $modelData.friends[friendIndex].universityName)
            }
            .padding(.leading, 20)
            Spacer()
            FavoriteButton(friend: friend)
        }
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var friends = FriendsViewModel().friends
    static var previews: some View {
        FriendsRow(friendsViewModel: FriendsViewModel(), friend: friends[0])
            .environmentObject(FriendsViewModel())
    }
}


