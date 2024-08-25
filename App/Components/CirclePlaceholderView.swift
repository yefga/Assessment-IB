//
//  UserPhotoView.swift
//  AppTests
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

enum CirclePlaceholderType {
    case icon(name: String)
    case imageURL(_ url: String, size: NSNumber)
    case uiImage(_ image: UIImage?)
    case loader
}

struct CirclePlaceholderView: View {
    
    var type: CirclePlaceholderType
 
    var body: some View {
        ZStack {
            Circle().fill(
                Color(
                    #colorLiteral(
                        red: 1.0,
                        green: 0.9,
                        blue: 0.8,
                        alpha: 1.0
                    )
                )
            )
            .padding(.top, 10)
            .padding(.leading, 10)
            
            SetImage
            
            .background(Color.white)
            .clipShape(
                Circle()
            )
            .overlay(
                Circle()
                    .stroke(Color.black,lineWidth: 2)
            )
            .padding(6)
        }

    }
    
    @ViewBuilder
    var SetImage: some View {
        switch type {
        case .icon(let name):
            Image(name)
                .resizable()
                .scaledToFit()
                .padding(8)
        case .imageURL(let urlString, let size):
            AsyncImage(
                url: URL(
                    string: "\(urlString)/\(size)"
                )
            ) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.black100.colorFormat
            }
        case .uiImage(let image):
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Color.black100.colorFormat
            }
        case .loader:
            ProgressView()
                .padding(5)
        }
    }
}

enum ImageType: String {
    case icon = "icon_magnifier"
    case photo = "mock_profile_picture"
}

#Preview {
    return CirclePlaceholderView(
        type: .icon(name: ImageType.icon.rawValue)
    )
    .frame(width: 150, height: 150)
}

