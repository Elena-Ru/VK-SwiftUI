//
//  LikeNewsControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct LikeNewsControl: View {
   @State var isLike: Int
   @State var qty: Int
    
   
    var body: some View {
        HStack{
            LikeButton(isUserLike: $isLike ,likeQty: $qty)
            LikeQuantityButton(likeQty: $qty, isUserLike: $isLike)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}
