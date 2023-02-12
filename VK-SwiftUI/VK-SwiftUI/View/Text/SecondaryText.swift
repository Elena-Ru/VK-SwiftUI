//
//  SecondaryText.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct SecondaryText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .font(.caption)
            .foregroundColor(.secondary)
            .textSelection(.enabled)
    }
}

