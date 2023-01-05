//
//  Secondary2lineText.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct Secondary2lineText: View {
    @Binding var text: String
    var body: some View {
        Text(text)
            .lineLimit(2)
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct Secondary2lineText_Previews: PreviewProvider {
    static var previews: some View {
        Secondary2lineText(text: .constant("University name"))
    }
}
