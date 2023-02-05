//
//  GroupRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI
import RealmSwift

struct GroupRow: View {
    @ObservedRealmObject var group: Group
   // @ObservedObject var group: Group
    
    var body: some View {
       contentView
        .padding()
    }
    var contentView: some View {
        HStack (spacing: 30) {
            Avatar(avatar: $group.photoGroup)
            groupInfo
            Spacer()
        }
    }
    var groupInfo: some View {
        VStack (alignment: .leading) {
            NameBoldText(name: $group.name)
            Text(group.screenName)
                .modifier(SecondaryText())
        }
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var groups = GroupViewModel().groups
    static var previews: some View {
        GroupRow(group: groups[0])
            .environmentObject(GroupViewModel())
    }
}

