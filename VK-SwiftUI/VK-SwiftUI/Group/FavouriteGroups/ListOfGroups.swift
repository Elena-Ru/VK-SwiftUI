//
//  ListOfGroups.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 29.01.2023.
//

import SwiftUI
import RealmSwift

struct ListOfGroups: View {
    @ObservedObject var groupsViewModel = GroupViewModel()
    var groups: [Group]
    
    fileprivate func delete(_ index: IndexSet) {
        guard let index = index.first else { return }
        let selectedGroup = groupsViewModel.groups[index]
        groupsViewModel.deleteFromFavorite(groupToDelete: selectedGroup)
    }
    
    var body: some View {
        List {
            ForEach(groups) { group in
                GroupRow( groupsViewModel: groupsViewModel, group: group)
            }
            .onDelete(perform: delete)
        }
        .background(Color(uiColor: .systemBackground))
        .navigationTitle("My Groups")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink(destination: AllGroupsList(), label: {
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
