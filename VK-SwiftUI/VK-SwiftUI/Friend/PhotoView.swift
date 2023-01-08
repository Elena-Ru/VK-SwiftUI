//
//  PhotoView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI

struct PhotoView: View {
    @EnvironmentObject var modelData: ModelData
    @State var currentIndex: Int
    
    var body: some View {
            TabView(selection: $currentIndex) {
                ForEach(modelData.photos.indices, id: \.self){ index in
                    Image(modelData.photos[index].photoName)
                            .resizable()
                            .scaledToFit()
                            .tag(index)
                            .padding()
                    }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct PhotoView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PhotoView(currentIndex: 0)
            .environmentObject(modelData)
    }
}
