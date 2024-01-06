//
//  Avatar.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct Avatar: View {
    @Binding var avatar: String
    @State private var showAnimation = false

    var body: some View {
        WebImage(url: URL(string: avatar))
            .resizable()
            .scaledToFill()
            .modifier(CircleShadow())
            .scaleEffect(showAnimation ? 0.8 : 1.0)
            .onTapGesture {
                showAnimation.toggle()
                withAnimation(.interactiveSpring(response: 0.2, dampingFraction: 0.9, blendDuration: 0.5).repeatCount(1, autoreverses: true)) {
                    showAnimation.toggle()
                }
            }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(avatar: .constant("tom"))
    }
}
