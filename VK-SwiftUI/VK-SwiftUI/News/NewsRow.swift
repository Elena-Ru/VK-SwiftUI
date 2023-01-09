//
//  NewsRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI

struct NewsRow: View {
    
    @EnvironmentObject var modelData: ModelData
   //@ScaledMetric(relativeTo: .caption2) var paddingWidth = 7
    var newsItem: News
    var newsIndex: Int {
        modelData.news.firstIndex(where: { $0.id == newsItem.id })!
       }
    
    var body: some View {
        VStack {
            HStack(){
                Avatar(avatar: $modelData.news[newsIndex].ownerAvatar)
                VStack (alignment: .leading) {
                    NameBoldText(name: $modelData.news[newsIndex].ownerName)
                    Secondary2lineText(text: $modelData.news[newsIndex].date)
                }
                .padding(.leading, 20)
                Spacer()
            }
            Text(modelData.news[newsIndex].text)
            Image(modelData.news[newsIndex].attachments)
                .resizable()
                .scaledToFit()
            HStack{
                    Button {
                        print("like button tapped")
                    } label: {
                        Label("\(modelData.news[newsIndex].likes)", systemImage: "heart")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#244469"))
                            .padding(7)
                            .background(.thinMaterial, in: Capsule())
                            .labelStyle(.titleAndIcon)
                            
                    }
                    Button {
                        print("Comment button tapped")
                    } label: {
                        Label("\(modelData.news[newsIndex].comments)", systemImage: "bubble.left")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#244469"))
                            .padding(7)
                            .background(.thinMaterial, in: Capsule())
                            .labelStyle(.titleAndIcon)
                    }
                    Button {
                        print("Shared button tapped")
                    } label: {
                        Label("\(modelData.news[newsIndex].reposts)", systemImage: "arrowshape.turn.up.right")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#244469"))
                            .padding(7)
                            .background(.thinMaterial, in: Capsule())
                            .labelStyle(.titleAndIcon)
                    }
                Spacer()
                Label("\(modelData.news[newsIndex].reposts)", systemImage: "eye")
                    .font(.caption)
                    .foregroundColor(Color(hex: "#244469"))
                    .padding(7)
                    .background(.thinMaterial, in: Capsule())
                    .labelStyle(.titleAndIcon)
            }
        }
        
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var news = ModelData().news
    static var previews: some View {
        NewsRow( newsItem: news[2])
            .environmentObject(ModelData())
    }
}
