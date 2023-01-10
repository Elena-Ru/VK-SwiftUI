//
//  LikeButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isUserLike: Bool
    @Binding var likeQty: Int
    
    var body: some View {
        Button {
            isUserLike.toggle()
            likeQty = isUserLike ? likeQty + 1 : likeQty - 1
        } label: {
            Label("Toggle Favorite", systemImage: isUserLike ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isUserLike ? Color(hex: "#e84f37") : Color(hex: "#244469"))
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(isUserLike: .constant(false), likeQty: .constant(0))
    }
}
