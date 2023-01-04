//
//  GroupRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct GroupRow: View {
    @State private var subscribersCount = 43461
    @State private var groupName = "HASH"
    @State private var groupCategory = "Программирование"
    
    var body: some View {
        HStack (spacing: 30) {
            
            Image("group")
                .resizable()
                .modifier(CircleShadow())
            VStack (alignment: .leading) {
                NameBoldText(name: $groupName)
                Text(groupCategory)
                    .lineLimit(2)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(subscribersCount) подписчик")
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var previews: some View {
        GroupRow()
    }
}
