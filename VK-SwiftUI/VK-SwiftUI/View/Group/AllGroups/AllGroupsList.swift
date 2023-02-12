//
//  AllGroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI
import AlertX
import RealmSwift

struct AllGroupsList: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var groupsViewModel : GroupViewModel
    @ObservedResults(Group.self) var itemGroups
    @State var allGroups : [Group] = []
//    let session = Session.shared
    @State var isAlreadyExist: Bool = false
    
    var body: some View {
    contentView
        .onAppear{
            groupsViewModel.getGroupsAll(token: UserDefaults.standard.string(forKey: "token") ?? "") { items in
                self.allGroups = items
            }
        }
        .ignoresSafeArea()
    }
    
    var contentView: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $groupsViewModel.searchText)
                List {
                    ForEach(allGroups) { group in
                        AllGroupRow(groupsViewModel: groupsViewModel, group: group)
                            .onTapGesture {
                                if (itemGroups.first(where: { $0.id == group.id
                                }) != nil) {
                                    isAlreadyExist = true
                                    print("Already contains")
                                } else {
                                    $itemGroups.append(group)
                                    groupsViewModel.getGroups()
                                    self.presentation.wrappedValue.dismiss()
                                }
                            }
                     }
                }
                .alertX(isPresented: $isAlreadyExist, content: {
                      AlertX(title: Text("This group is already in your favorites."),
                             theme: .cherry(withTransparency: true, roundedCorners: true))
                })
                .background(Color(uiColor: .systemBackground))
                .navigationTitle("All Groups")
            .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
       
}


//struct AllGroupsList_Previews: PreviewProvider {
//    static var previews: some View {
//        AllGroupsList( groupsViewModel: GroupViewModel())
//            .environmentObject(GroupViewModel())
//    }
//}
