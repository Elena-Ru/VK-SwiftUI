//
//  FriendPhotos.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

// MARK: - PhotoView
struct FriendPhotos: View {
    @ObservedObject var photoVieModel = PhotoViewModel()
    @State var photos : [RLMPhoto] = []
    let columnLayout = Array(repeating: GridItem(.flexible(minimum: Constants.minimumSize, maximum: .infinity)), count: Constants.colomnCount)
    var friend: RLMFriend
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columnLayout, alignment: .center, spacing: Constants.itemSpacing) {
                  if !photoVieModel.photos.isEmpty {
                        ForEach(photoVieModel.photos.indices, id: \.self) { index in
                            VStack {
                                NavigationLink(destination: PhotoView(photoViewModel: photoVieModel, currentIndex: index)) {
                                    WebImage(url: URL(string: (photoVieModel.photos[index].url)))
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(1, contentMode: .fill)
                                        .cornerRadius(Constants.cornerRadius)
                                }
                                LikeControl(isLike: photoVieModel.photos[index].userLikes, qty: photoVieModel.photos[index].count, owner: friend.id, item: photoVieModel.photos[index].id )
                                    .padding(.top, Constants.topPadding)
                                    .padding(.trailing, Constants.trailingPadding)
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
}

// MARK: - Private methods
private extension FriendPhotos {
    func getPhotos() {
        photoVieModel.getUserPhotos(
            token: AuthenticationManager.shared.accessToken ?? .empty,
            idFriend: friend.id
        ) { items in
              self.photos = items
          }
    }
}

// MARK: - Constants
private extension FriendPhotos {
  enum Constants {
      static let trailingPadding: CGFloat = -60
      static let topPadding: CGFloat = -5
      static let cornerRadius: CGFloat = 12
      static let minimumSize: CGFloat = 50
      static let colomnCount: Int = 2
      static let itemSpacing: CGFloat = 6
  }
}
