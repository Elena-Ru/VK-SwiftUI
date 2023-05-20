//
//  CircleShadow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI


struct CircleShadow: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .frame(width: 70, height: 70)
      .cornerRadius(35)
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.white, lineWidth: 3).shadow(radius: 7)
      }
      .shadow(radius: 10)
  }
}
