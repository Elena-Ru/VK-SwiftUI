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
    
    var body: some View {
        HStack (spacing: 30){
            
            Image("tom")
                .resizable()
                .modifier(CircleShadow())
            VStack (alignment: .leading) {
                NameBoldText(name: $fullName)
                Text("Johnson State College")
                    .lineLimit(2)
                    .font(.caption)
                    .foregroundColor(.secondary)
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
