//
//  LoginButtonStyle.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import Foundation
import SwiftUI

struct LoginButtonStyle: ButtonStyle {
    var disabled = true
    
    public func makeBody(configuration: LoginButtonStyle.Configuration) -> some View {
        
        configuration.label
            .frame(width: 200, height: 40)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .background(disabled ? .red.opacity(0.6) : .blue.opacity(0.6))
            .cornerRadius(16)
            .compositingGroup()
            .shadow(color: .black, radius: 3)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
           
    }
}
