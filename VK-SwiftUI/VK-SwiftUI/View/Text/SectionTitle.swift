//
//  SectionTitle.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct SectionTitle: View {
    var title: Character
    var body: some View {
        Text(String(title.uppercased()))
            .foregroundColor(Color(hex: "#244469"))
            .font(.headline)
            .bold()
            .offset(x: 30)
            .padding(.bottom, 0)
            .padding(.top, -20)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(title: "T" )
    }
}
