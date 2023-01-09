//
//  LikeNewsControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct LikeNewsControl: View {
    @EnvironmentObject var modelData: ModelData
    var newsItem: News
    var index: Int {
        modelData.news.firstIndex(where: { $0.id == newsItem.id
        })!
    }
   
    var body: some View {
        HStack{
            LikeButton(isUserLike: $modelData.news[index].isUserLike, likeQty: $modelData.news[index].likes)
            LikeQuantityButton(likeQty: $modelData.news[index].likes, isUserLike: $modelData.news[index].isUserLike)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct LikeNewsControl_Previews: PreviewProvider {
    static var news = ModelData().news
    static var previews: some View {
        LikeNewsControl( newsItem: news[0])
            .environmentObject(ModelData())
    }
}
