//
//  LikeQuantityButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeQuantityButton: View {
    @Binding var likeQty: Int
    @Binding var isUserLike: Int
    
    var body: some View {
        Button(String(likeQty)) {
            
            isUserLike = isUserLike == 1 ? 0 : 1
            likeQty = isUserLike == 1 ? likeQty + 1 : likeQty - 1
        }
        .foregroundColor(isUserLike == 1 ? .blue : Color("RegularControlColor"))
    }
}

struct LikeQuantityButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeQuantityButton( likeQty: .constant(0), isUserLike: .constant(0) )
    }
}
