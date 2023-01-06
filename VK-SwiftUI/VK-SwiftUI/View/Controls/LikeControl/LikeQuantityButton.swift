//
//  LikeQuantityButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeQuantityButton: View {
    @Binding var likeQty: Int
    @Binding var isUserLike: Bool
    
    var body: some View {
        Button(String(likeQty)) {
            
            isUserLike.toggle()
            likeQty = isUserLike ? likeQty + 1 : likeQty - 1
        }
        .foregroundColor(isUserLike ? .blue : .gray)
    }
}

struct LikeQuantityButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeQuantityButton( likeQty: .constant(0), isUserLike: .constant(false) )
    }
}
