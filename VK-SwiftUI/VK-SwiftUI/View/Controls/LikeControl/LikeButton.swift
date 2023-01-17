//
//  LikeButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isUserLike: Int
    @Binding var likeQty: Int
    
    var body: some View {
        Button {
            isUserLike = isUserLike == 1 ? 0 : 1
            likeQty = isUserLike == 1 ? likeQty + 1 : likeQty - 1
        } label: {
            Label("Toggle Favorite", systemImage: isUserLike == 1 ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isUserLike == 1 ? Color(hex: "#e84f37") : Color(hex: "#244469"))
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(isUserLike: .constant(1), likeQty: .constant(0))
    }
}
