//
//  SharedControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct SharedControl: View {
    var count: Int
    var body: some View {
        Button {
            print("Shared button tapped")
        } label: {
            Label("\(count)", systemImage: "arrowshape.turn.up.right")
                .modifier(CapsuleControl())
        }
    }
}

struct SharedControl_Previews: PreviewProvider {
    
    static var previews: some View {
        SharedControl(count: 3)
    }
}
