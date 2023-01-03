//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI

struct FriendsRow: View {
    var body: some View {
        Image("tom")
            .resizable()
            .frame(width: 70, height: 70)
            .cornerRadius(35)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 3).shadow(radius: 7)
            }
            .shadow(radius: 10)
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendsRow()
    }
}
