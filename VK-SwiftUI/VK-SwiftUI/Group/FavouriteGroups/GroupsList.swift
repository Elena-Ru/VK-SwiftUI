//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI

struct GroupsList: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var groupsViewModel = GroupViewModel()
    @State var groups : [Group] = []
    let session = Session.shared
    
    fileprivate func delete(_ index: IndexSet) {
        modelData.groups.remove(atOffsets: index)
    }
    
    var body: some View {

        NavigationStack {
            List {
                ForEach(groups, id: \.self) { group in
                    GroupRow( group: group)
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
        .ignoresSafeArea()
    }
}

struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsList()
            .environmentObject(ModelData())
    }
}


