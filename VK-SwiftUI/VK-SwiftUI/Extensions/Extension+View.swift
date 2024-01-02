//
//  Extension+UIView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
