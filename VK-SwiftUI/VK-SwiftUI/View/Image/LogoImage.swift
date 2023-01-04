//
//  LogoImage.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image("vkLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 120 , height: 120)
    }
}

struct LogoImage_Previews: PreviewProvider {
    static var previews: some View {
        LogoImage()
    }
}
