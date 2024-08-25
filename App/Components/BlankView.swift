//
//  BlackView.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct BlankData {
    let title: String
    let subtitle: String
    let image: String
}

struct BlankView: View {
    let data: BlankData
    var body: some View {
        VStack(spacing: 24) {
            Image(data.image)
                .resizable()
                .scaledToFit()
                
            VStack(spacing: 8) {
                Text(data.title)
                    .font(.workSans(type: .semiBold, size: .medium))
                Text(data.subtitle)
                    .font(.workSans(type: .regular, size: .medium))
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    BlankView(
        data: .init(
            title: "Your World, Offline",
            subtitle: "Explore, Engage, Enjoy with your Internet Connection",
            image: "image_offline"
        )
    ).padding()
}
