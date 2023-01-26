//
//  LikeButtonNews.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 24.01.2023.
//


import SwiftUI

struct LikeButtonNews: View {
    @Binding var isUserLike: Int
    @Binding var likeQty: Int
    @State var isScaled: Bool = false
    @State var innerHeart: Bool = false
   
    
    var body: some View {
        Button {
            isUserLike = isUserLike == 1 ? 0 : 1
            likeQty = isUserLike == 1 ? likeQty + 1 : likeQty - 1
            
            
            withAnimation(.interactiveSpring(response: 0.2, dampingFraction: 0.9, blendDuration: 0.5)){
                isScaled.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.9, blendDuration: 0.9)){
                    innerHeart.toggle()
                }
            }
        } label: {
            Label("Toggle Favorite", systemImage: isUserLike == 1 ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isUserLike == 1 ? Color(hex: "#e84f37") : Color(hex: "#244469"))
                .scaleEffect(isScaled ? 1.5 : 1)
        }
        .overlay {
            InnerHeart()
                .opacity(innerHeart ? 1 : 0)
                .rotationEffect(.degrees(innerHeart ? 360 : 0))
        }
       
    }
}

struct LikeButtonNews_Previews: PreviewProvider {
    static var previews: some View {
        LikeButtonNews(isUserLike: .constant(1), likeQty: .constant(0), isScaled: true)
    }
}