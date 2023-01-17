//
//  PhotoView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PhotoView: View {
    @StateObject var photoViewModel: PhotoViewModel
    @State var currentIndex: Int
    
    var body: some View {
            TabView(selection: $currentIndex) {
                ForEach(photoViewModel.photos.indices, id: \.self){ index in
                    WebImage(url: URL(string: (photoViewModel.photos[index].url)))
                            .resizable()
                            .scaledToFit()
                            .tag(index)
                            .padding()
                    }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

