//
//  GroupRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct GroupRow: View {
    @EnvironmentObject var modelData: ModelData
    var group: Group
    var groupIndex: Int? {
           modelData.groups.firstIndex(where: { $0.id == group.id }) ?? nil
       }
    
    var body: some View {
        if let index = groupIndex{
            HStack (spacing: 30) {
                Avatar(avatar: $modelData.groups[index].imageLogo)
                VStack (alignment: .leading) {
                    NameBoldText(name: $modelData.groups[index].groupName)
                    Secondary2lineText(text: $modelData.groups[index].groupCategory)
                    Text("\(modelData.groups[index].subscribersQty) subscribers")
                        .modifier(SecondaryText())
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var groups = ModelData().groups
    static var previews: some View {
        GroupRow(group: groups[0])
            .environmentObject(ModelData())
    }
}


