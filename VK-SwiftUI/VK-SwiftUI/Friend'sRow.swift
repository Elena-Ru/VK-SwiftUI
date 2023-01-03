//
//  Friend'sRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.01.2023.
//

import SwiftUI

struct FriendsRow: View {
    var body: some View {
        HStack (spacing: 30){
            
            Image("tom")
                .resizable()
                .modifier(CircleShadow())
            VStack {
                Text("Tom Cruise")
                    .bold()
                
                Text("Johnson State College")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
}

struct FriendsRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendsRow()
    }
}
