//
//  FriendPhotos.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct FriendPhotos: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var friendsViewModel = FriendsViewModel()
    var friend: Friend
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnLayout, alignment: .center, spacing: 6) {
                
                ForEach(modelData.photos.indices, id: \.self) { index in
                    
                    VStack {
                        NavigationLink(destination: PhotoView(currentIndex: index)) {
                            Image(modelData.photos[index].photoName)
                                 .resizable()
                                 .clipped()
                                 .aspectRatio(1, contentMode: .fill)
                             .cornerRadius(12)
                        }
                        LikeControl( photo: modelData.photos[index])
                            .padding(.top, -5)
                            .padding(.trailing, -60)
                    }
                }
                .frame(maxWidth: 300)
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
            .environmentObject(ModelData())
    }
}



//    @EnvironmentObject var modelData: ModelData
//    var friend: Friend
//    let columnLayout = Array(repeating: GridItem(), count: 2)
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columnLayout, alignment: .center, spacing: 6) {
//
//                ForEach(modelData.photos.indices, id: \.self) { index in
//
//                    VStack {
//                        NavigationLink(destination: PhotoView(currentIndex: index)) {
//                            Image(modelData.photos[index].photoName)
//                                 .resizable()
//                                 .clipped()
//                                 .aspectRatio(1, contentMode: .fill)
//                             .cornerRadius(12)
//                        }
//                        LikeControl( photo: modelData.photos[index])
//                            .padding(.top, -5)
//                            .padding(.trailing, -60)
//                    }
//                }
//                .frame(maxWidth: 300)
//            }
//            .padding()
//        }
//        .navigationTitle(friend.firstName)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//struct FriendPhotos_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotos(friend: ModelData().friends[0])
//            .environmentObject(ModelData())
//    }
//}
