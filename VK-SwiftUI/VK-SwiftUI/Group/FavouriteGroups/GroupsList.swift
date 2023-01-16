//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI
import RealmSwift

struct GroupsList: View {
    
    @ObservedObject var groupsViewModel = GroupViewModel()
    let session = Session.shared
    
//    fileprivate func delete(_ index: IndexSet) {
//        groupsViewModel.groups.remove(atOffsets: index)
//    }
    
    var body: some View {

        NavigationStack {
            if let groups = groupsViewModel.groups{
                List {
                    ForEach(groups) { group in
                        GroupRow( groupsViewModel: groupsViewModel, group: group)
                    }
                    //.onDelete(perform: delete)
                }
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
        .onAppear{
            groupsViewModel.getUserGroups(token: session.token, id: session.userID) { items in
                print(items)
            }
        }
        .ignoresSafeArea()
    }
}

struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsList()
            .environmentObject(GroupViewModel())
    }
}


