//
//  ListOfGroups.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 29.01.2023.
//

import SwiftUI
import RealmSwift

struct ListOfGroups: View {
    @ObservedObject var groupsViewModel : GroupViewModel
//    var groups: [Group]
    @ObservedResults(Group.self) var itemGroups
   // @ObservedRealmObject var groups: Group
    
    var body: some View {
        List {
            ForEach(itemGroups) { group in
                GroupRow( group: group)
            }
            .onDelete(perform: $itemGroups.remove)
//            .onDelete(perform: groupsViewModel.delete)
        }
        .background(Color(uiColor: .systemBackground))
        .navigationTitle("My Groups")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink(destination: AllGroupsList( groupsViewModel: groupsViewModel), label: {
                    AddButton()
                })
                .isDetailLink(false)
            })
        }
    }
}

//struct ListOfGroups_Previews: PreviewProvider {
//    static var previews: some View {
//        ListOfGroups(, groups: <#[Group]#>)
//    }
//}
