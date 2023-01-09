//
//  SharedControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct SharedControl: View {
    @EnvironmentObject var modelData: ModelData
    var newsItem: News
    var index: Int {
        modelData.news.firstIndex(where: { $0.id == newsItem.id
        })!
    }
    var body: some View {
        Button {
            print("Shared button tapped")
        } label: {
            Label("\(modelData.news[index].reposts)", systemImage: "arrowshape.turn.up.right")
                .modifier(CapsuleControl())
        }
    }
}

struct SharedControl_Previews: PreviewProvider {
    static var news = ModelData().news
    static var previews: some View {
        SharedControl(newsItem: news[0])
            .environmentObject(ModelData())
    }
}
