//
//  AddButton.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .font(.title)
            .foregroundColor(Color("CustomControlColor"))
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
