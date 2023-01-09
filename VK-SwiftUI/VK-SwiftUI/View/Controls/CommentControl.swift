//
//  CommentControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct CommentControl: View {
    @EnvironmentObject var modelData: ModelData
    var newsItem: News
    var index: Int {
        modelData.news.firstIndex(where: { $0.id == newsItem.id
        })!
    }
    
    var body: some View {
        Button {
            print("Comment button tapped")
        } label: {
            Label("\(modelData.news[index].comments)", systemImage: "bubble.left")
                .modifier(CapsuleControl())
        }
    }
}

struct CommentControl_Previews: PreviewProvider {
    static var news = ModelData().news
    static var previews: some View {
        CommentControl(newsItem: news[0])
            .environmentObject(ModelData())
    }
}
