//
//  NameBoldText.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct NameBoldText: View {
    @Binding var name: String
    var body: some View {
        Text(name)
            .bold()
            .truncationMode(.tail)
            .lineLimit(1)
            .textSelection(.enabled)
            .textSelection(.enabled)
    }
}

struct NameBoldText_Previews: PreviewProvider {
    static var previews: some View {
        NameBoldText(name: .constant("Name of Person/Group"))
    }
}
