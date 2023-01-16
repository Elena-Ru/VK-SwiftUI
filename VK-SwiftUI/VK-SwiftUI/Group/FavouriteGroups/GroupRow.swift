//
//  GroupRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI
import RealmSwift

struct GroupRow: View {
    @StateObject var groupsViewModel:  GroupViewModel
    @ObservedRealmObject var group: Group
    
    var body: some View {
            HStack (spacing: 30) {
                Avatar(avatar: $group.photoGroup)
                VStack (alignment: .leading) {
                    NameBoldText(name: $group.name)
                    Text(group.screenName)
                        .modifier(SecondaryText())
                }
                Spacer()
            }
            .padding()
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var groups = GroupViewModel().groups
    static var previews: some View {
        GroupRow(groupsViewModel: GroupViewModel(), group: groups[0])
            .environmentObject(GroupViewModel())
    }
}

