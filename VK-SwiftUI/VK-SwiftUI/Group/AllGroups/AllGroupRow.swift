//
//  AllGropuRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI

struct AllGroupRow: View {
    
    @StateObject var groupsViewModel:  GroupViewModel
    var group: Group
    var groupIndex: Int? {
        groupsViewModel.allGroups.firstIndex(of: group)!
       }
    
    var body: some View {
        if let index = groupIndex{
            HStack (spacing: 30) {
                Avatar(avatar: $groupsViewModel.allGroups[index].photoGroup)
                VStack (alignment: .leading) {
                    NameBoldText(name: $groupsViewModel.allGroups[index].name)
                    Text(groupsViewModel.allGroups[index].screenName)
                        .modifier(SecondaryText())
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct AllGropuRow_Previews: PreviewProvider {
    static var groups = GroupViewModel().allGroups
    static var previews: some View {
        AllGroupRow(groupsViewModel: GroupViewModel(), group: groups[4])
            .environmentObject(GroupViewModel())
    }
}
