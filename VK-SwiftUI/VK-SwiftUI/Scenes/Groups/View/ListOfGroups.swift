//
//  ListOfGroups.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 29.01.2023.
//

import SwiftUI
import RealmSwift

struct ListOfGroups: View {
    @ObservedObject var groupsViewModel: GroupViewModel
    @ObservedResults(Group.self) var itemGroups
    
    var body: some View {
        List {
            ForEach(itemGroups) { group in
                GroupRow( group: group)
            }
            .onDelete(perform: delete)
        }
        .background(Color(uiColor: .systemBackground))
        .navigationTitle(Texts.FavoritesGroups.favGroupsTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink(destination: AllGroupsList( groupsViewModel: groupsViewModel), label: {
                    AddButton()
                })
                .isDetailLink(false)
            })
            ToolbarItem(placement: .navigationBarLeading, content: {
                EditButton()
            })
        }
    }
    
    func delete(at offsets: IndexSet) {
        let index = offsets[offsets.startIndex]
        groupsViewModel.leaveGroup(groupId: itemGroups[index].id)
        $itemGroups.remove(atOffsets: offsets)
    }
}
