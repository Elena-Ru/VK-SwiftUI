//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI

struct GroupsList: View {
    
    @ObservedObject var groupsViewModel = GroupViewModel()
    @State var groups : [Group] = []
    let session = Session.shared
    
    fileprivate func delete(_ index: IndexSet) {
        groupsViewModel.groups.remove(atOffsets: index)
    }
    
    var body: some View {

        NavigationStack {
            List {
                ForEach(groups) { group in
                    GroupRow( groupsViewModel: groupsViewModel, group: group)
                 }
                .onDelete(perform: delete)
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
        .onAppear{
            groupsViewModel.getUserGroups(token: session.token, id: session.userID) { items in
                self.groups = items
                print(self.groups)
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


