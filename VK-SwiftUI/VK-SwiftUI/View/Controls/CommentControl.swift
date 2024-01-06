//
//  CommentControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct CommentControl: View {
    var count: Int
    
    var body: some View {
        Button {
            print("Comment button tapped")
        } label: {
            Label("\(count)", systemImage: "bubble.left")
                .modifier(CapsuleControl())
        }
    }
}
