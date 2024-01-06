//
//  LikeNewsControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct LikeNewsControl: View {
    var idOwner: Int
    var itemId: Int
   	@State var isLike: Int
   	@State var qty: Int
    
    var body: some View {
        HStack {
            LikeButtonNews(isUserLike: $isLike, likeQty: $qty, idOwner: idOwner, itemId: itemId)
            LikeQuantityButton(likeQty: $qty, isUserLike: $isLike)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}
