//
//  NewsRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI

struct NewsRow: View {
    
    @EnvironmentObject var modelData: ModelData
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
            HStack {
                LikeNewsControl(newsItem: newsItem)
                    .modifier(CapsuleControl())
                CommentControl( newsItem: newsItem)
                SharedControl( newsItem: newsItem)
                Spacer()
                ViewsControl(newsItem: newsItem)
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







