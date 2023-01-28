//
//  LikeButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct LikeButton: View {
    @ObservedObject var photoViewModel = PhotoViewModel()
    @Binding var isUserLike: Int
    @Binding var likeQty: Int
    @Binding var idFriend: Int
    @Binding var itemId: Int
    @State var isScaled: Bool = false
    @State var innerHeart: Bool = false
    
    var body: some View {
        Button {
            buttonPressed()
        } label: {
            Label("Toggle Favorite", systemImage: isUserLike == 1 ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isUserLike == 1 ? Color("CustomControlColor") : Color("RegularControlColor"))
                .scaleEffect(isScaled ? 1.5 : 1)
                .scaleEffect((isUserLike == 1  && !isScaled) ? 1.5 : 1)
                .overlay {
                    InnerHeart()
                        .opacity((isUserLike == 1 &&  !innerHeart) ? 1 : 0)
                }
        }
        .overlay {
            InnerHeart()
                .opacity(isUserLike == 1 ? 1 : 0)
                .rotationEffect(.degrees(innerHeart ? 360 : 0))
        }
    }
    func buttonPressed(){
        isUserLike = isUserLike == 1 ? 0 : 1
        likeQty = isUserLike == 1 ? likeQty + 1 : likeQty - 1
        
        photoViewModel.postLike(isLike: &isUserLike, owner: idFriend, item: itemId)
        
        withAnimation(.interactiveSpring(response: 0.2, dampingFraction: 0.9, blendDuration: 0.5)){
            isScaled.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.9, blendDuration: 0.9)){
                innerHeart.toggle()
            }
        }
    }
}
