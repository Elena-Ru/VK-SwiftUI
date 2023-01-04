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
    @State private var groupImage = "group"
    
    var body: some View {
        HStack (spacing: 30) {
            
            Avatar(avatar: $groupImage)
            VStack (alignment: .leading) {
                NameBoldText(name: $groupName)
                Secondary2lineText(text: $groupCategory)
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


