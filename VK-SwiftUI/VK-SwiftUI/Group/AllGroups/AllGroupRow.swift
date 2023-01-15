////
////  AllGropuRow.swift
////  VK-SwiftUI
////
////  Created by Елена Русских on 07.01.2023.
////
//
//import SwiftUI
//
//struct AllGroupRow: View {
//    @EnvironmentObject var modelData: ModelData
//    var group: Group
//    var groupIndex: Int? {
//           modelData.allGroups.firstIndex(where: { $0.id == group.id }) ?? nil
//       }
//    
//    var body: some View {
//        if let index = groupIndex{
//            HStack (spacing: 30) {
//                Avatar(avatar: $modelData.allGroups[index].imageLogo)
//                VStack (alignment: .leading) {
//                    NameBoldText(name: $modelData.allGroups[index].groupName)
//                    Secondary2lineText(text: $modelData.allGroups[index].groupCategory)
//                    Text("\(modelData.allGroups[index].subscribersQty) subscribers")
//                        .modifier(SecondaryText())
//                }
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}
//
//struct AllGropuRow_Previews: PreviewProvider {
//    static var groups = ModelData().allGroups
//    static var previews: some View {
//        AllGroupRow(group: groups[4])
//            .environmentObject(ModelData())
//    }
//}
