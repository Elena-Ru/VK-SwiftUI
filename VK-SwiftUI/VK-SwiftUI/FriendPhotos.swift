//
//  FriendPhotos.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendPhotos: View {
    @EnvironmentObject var modelData: ModelData
    var friend: Friend
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnLayout) {
                
                ForEach(modelData.photos.indices, id: \.self) { index in
                    Image(modelData.photos[index].photoName)
                         .resizable()
                         .scaledToFit()
                         .cornerRadius(12)
                }
            }
           .padding()
        }
        .navigationTitle(friend.firstName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FriendPhotos_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotos(friend: ModelData().friends[0])
    }
}
