//
//  LikeControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeControl: View {
    @State var isLike: Int
    @State var qty: Int

    var body: some View {
        HStack{
            LikeButton(isUserLike: $isLike, likeQty: $qty)
            LikeQuantityButton(likeQty: $qty, isUserLike: $isLike)
        }
    }
}


