//
//  CapsuleControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import Foundation
import SwiftUI

struct CapsuleControl: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(Color(hex: "#244469"))
            .padding(7)
            .background(.thinMaterial, in: Capsule())
            .labelStyle(.titleAndIcon)
    }
}
