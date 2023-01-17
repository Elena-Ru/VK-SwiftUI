//
//  FriendPhotos.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendPhotos: View {
    @ObservedObject var photoVieModel = PhotoViewModel()
    var friend: Friend
    @State var photos : [Photo] = []
    let session = Session.shared
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnLayout, alignment: .center, spacing: 6) {
                
                ForEach(photoVieModel.photos.indices, id: \.self) { index in
                    
                    VStack {
                        NavigationLink(destination: PhotoView(photoViewModel: photoVieModel, currentIndex: index)) {
                            WebImage(url: URL(string: (photoVieModel.photos[index].url)))
                                .resizable()
                                .clipped()
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(12)
                        }
                        LikeControl(isLike: photoVieModel.photos[index].userLikes, qty: photoVieModel.photos[index].count )
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
        .onAppear{
            photoVieModel.getUserPhotos(token: session.token, idFriend: friend.id) { items in
                self.photos = items
            }
        }
    }
}

              
