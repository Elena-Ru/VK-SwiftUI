//
//  LikeControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeControl: View {
    @EnvironmentObject var modelData: ModelData
    
    var photo: Photo
    
    var friendIndex: Int {
        modelData.photos.firstIndex(where: { $0.id == photo.id
        })!
    }
    
    var body: some View {
        HStack{
            LikeButton(isUserLike: $modelData.photos[friendIndex].isPhotoLike, likeQty: $modelData.photos[friendIndex].likeQty)
            LikeQuantityButton(likeQty: $modelData.photos[friendIndex].likeQty, isUserLike: $modelData.photos[friendIndex].isPhotoLike)
        }
    }
}

struct LikeControl_Previews: PreviewProvider {
    static var photos = ModelData().photos
    
    static var previews: some View {
        LikeControl( photo: photos[0])
            .environmentObject(ModelData())
    }
}
