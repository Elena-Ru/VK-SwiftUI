//
//  ListOfGroups.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 29.01.2023.
//

import SwiftUI
import RealmSwift

struct ListOfGroups: View {
    @EnvironmentObject var groupsViewModel : GroupViewModel
    var groups: [Group]
    
    var body: some View {
        List {
            ForEach(groups) { group in
                GroupRow( group: group)
            }
            .onDelete(perform: groupsViewModel.delete)
        }
        .background(Color(uiColor: .systemBackground))
        .navigationTitle("My Groups")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink(destination: AllGroupsList( groupsViewModel: _groupsViewModel), label: {
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
