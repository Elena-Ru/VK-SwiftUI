//
//  AllGroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI
import AlertX

struct AllGroupsList: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var groupsViewModel = GroupViewModel()
    @State var allGroups : [Group] = []
    let session = Session.shared
    @State var isAlreadyExist: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(allGroups) { group in
                    
                    AllGroupRow( groupsViewModel: groupsViewModel, group: group)
                        .onTapGesture {
                            if (groupsViewModel.groups.first(where: { $0.id == group.id
                            }) != nil) {
                                isAlreadyExist = true
                                print("Already contains")
                            } else {
                                groupsViewModel.groups.append(group)
                                self.presentation.wrappedValue.dismiss()
                            }
                        }
                 }
            }
            .alertX(isPresented: $isAlreadyExist, content: {
                  AlertX(title: Text("This group is already in your favorites."),
                         theme: .cherry(withTransparency: true, roundedCorners: true))
            })
            .navigationTitle("All Groups")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear{
            groupsViewModel.getGroupsAll(token: session.token) { items in
                self.allGroups = items
            }
        }
        .ignoresSafeArea()
    }
       
}


struct AllGroupsList_Previews: PreviewProvider {
    static var previews: some View {
        AllGroupsList()
            .environmentObject(GroupViewModel())
    }
}
