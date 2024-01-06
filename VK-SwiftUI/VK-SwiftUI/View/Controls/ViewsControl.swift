//
//  ViewsControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct ViewsControl: View {
    var count: Int
    var body: some View {
        Label("\(count)", systemImage: "eye")
            .modifier(CapsuleControl())
    }
}

struct ViewsControl_Previews: PreviewProvider {
    static var previews: some View {
        ViewsControl(count: 2)
    }
}
