//
//  GroupRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 04.01.2023.
//

import SwiftUI

struct GroupRow: View {
   // @EnvironmentObject var modelData: ModelData
    @StateObject var groupsViewModel:  GroupViewModel
    var group: Group
    var groupIndex: Int {
        print(groupsViewModel.groups)
        return groupsViewModel.groups.firstIndex(of: group)!
       }

    
    var body: some View {
      //  if let index = groupIndex{
            HStack (spacing: 30) {
                Avatar(avatar: $groupsViewModel.groups[groupIndex].photoGroup)
                VStack (alignment: .leading) {
                    NameBoldText(name: $groupsViewModel.groups[groupIndex].name)
                  //  Secondary2lineText(text: $groupsViewModel.groups[index].groupCategory)
                    Text("\(groupsViewModel.groups[groupIndex].membersCount) subscribers")
                        .modifier(SecondaryText())
                }
                Spacer()
            }
            .padding()
      //  }
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var groups = GroupViewModel().groups
    static var previews: some View {
        GroupRow(groupsViewModel: GroupViewModel(), group: groups[0])
            .environmentObject(GroupViewModel())
    }
}

