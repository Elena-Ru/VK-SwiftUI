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
    let columnLayout = Array(repeating: GridItem(.flexible(minimum: 50, maximum: .infinity)), count: 2)
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columnLayout, alignment: .center, spacing: 6) {
                    if let photos = photoVieModel.photos{
                        ForEach(photos.indices, id: \.self) { index in
                            VStack {
                                NavigationLink(destination: PhotoView(photoViewModel: photoVieModel, currentIndex: index)) {
                                    WebImage(url: URL(string: (photoVieModel.photos[index].url)))
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(1, contentMode: .fill)
                                        .cornerRadius(12)
                                }
                                LikeControl(isLike: photoVieModel.photos[index].userLikes, qty: photoVieModel.photos[index].count, owner: friend.id, item: photoVieModel.photos[index].id )
                                    .padding(.top, -5)
                                    .padding(.trailing, -60)
                            }
                        }
                        .frame(height: geometry.size.width/2)
                    }
                }
                .padding()
            }
            .navigationTitle(friend.firstName)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                getPhotos()
            }
        }
    }
        private func getPhotos() {
            photoVieModel.getUserPhotos(token: UserDefaults.standard.string(forKey: "token") ?? "", idFriend: friend.id) { items in
                self.photos = items
            }
        }
    }


