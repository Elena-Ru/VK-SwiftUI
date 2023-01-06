//
//  FriendPhotos.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendPhotos: View {
    
    var friend: Friend
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnLayout) {
                
                ForEach(photos.indices, id: \.self) { index in
                 Image(photos[index].photoName)
                         .resizable()
                         .scaledToFit()
                         .cornerRadius(12)
                }
            }
           .padding()
        }
        .navigationTitle(friend.firstName)
    }
}

struct FriendPhotos_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotos(friend: friends[0])
    }
}
