//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI

struct FriendsRow: View {
    @State var isFavorite = false
    @State private var fullName = "Tom Cruise"
    @State private var education = "Johnson State College"
    @State private var friendAvatar = "tom"
    
    var body: some View {
        HStack (spacing: 30){
            
            Avatar(avatar: $friendAvatar)
            VStack (alignment: .leading) {
                NameBoldText(name: $fullName)
                Secondary2lineText(text: $education)
            }
            Spacer()
            FavoriteButton(isSet: $isFavorite)
        }
        .padding()
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendsRow()
    }
}


