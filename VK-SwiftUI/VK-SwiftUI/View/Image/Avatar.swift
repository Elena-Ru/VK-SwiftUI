//
//  Avatar.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct Avatar: View {
    @Binding var avatar: String

    var body: some View {
        Image(avatar)
            .resizable()
            .modifier(CircleShadow())
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(avatar: .constant("tom"))
    }
}
