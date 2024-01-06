//
//  NoNetworkView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 26.01.2023.
//

import SwiftUI

// MARK: - NoNetworkView
struct NoNetworkView: View {
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 160)
                .font(.title)
                .foregroundColor(Color("CustomControlColor"))
          Text(Texts.NoNetwork.noNetwork)
                .padding(.top, 30)
        }
    }
}

// MARK: - Preview
struct NoNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}
