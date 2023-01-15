////
////  AllGroupsList.swift
////  VK-SwiftUI
////
////  Created by Елена Русских on 07.01.2023.
////
//
//import SwiftUI
//import AlertX
//
//struct AllGroupsList: View {
//    @EnvironmentObject var modelData: ModelData
//    @Environment(\.presentationMode) var presentation
//    @State var isAlreadyExist: Bool = false
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(modelData.allGroups) { group in
//                    
//                    AllGroupRow( group: group)
//                        .onTapGesture {
//                            if (modelData.groups.first(where: { $0.id == group.id
//                            }) != nil) {
//                                isAlreadyExist = true
//                                print("Already contains")
//                            } else {
//                                modelData.groups.append(group)
//                                self.presentation.wrappedValue.dismiss()
//                            }
//                        }
//                 }
//            }
//            .alertX(isPresented: $isAlreadyExist, content: {
//                  AlertX(title: Text("This group is already in your favorites."),
//                         theme: .cherry(withTransparency: true, roundedCorners: true))
//            })
//            .navigationTitle("All Groups")
//            .navigationBarTitleDisplayMode(.inline)
//            
//        }
//        .ignoresSafeArea()
//    }
//       
//}
//
//
//struct AllGroupsList_Previews: PreviewProvider {
//    static var previews: some View {
//        AllGroupsList()
//            .environmentObject(ModelData())
//    }
//}
