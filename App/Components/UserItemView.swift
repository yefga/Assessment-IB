//
//  UserItemview.swift
//  AppTests
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct UserItem {
    let name: String
    let userName: String
    let photo: Data?
}

struct UserItemView: View {
    
    let data: UserItem
    let isLoading: Bool
    
    var body: some View {
        HStack {
            if let data = data.photo {
                CirclePlaceholderView(
                    type: .uiImage(UIImage(data: data))
                ).frame(width: 40)
            } else {
                CirclePlaceholderView(type: .loader)
                    .frame(width: 40)
            }
            
                
            UserCardDetailView()
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 1)
        )
    }
    
    private func UserCardDetailView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(isLoading ? .shimmeringString : data.name)
                .font(
                    .workSans(
                        type: .semiBold,
                        size: .medium
                    )
                )
                .foregroundColor(isLoading ? .clear : .black)
                .shimmering(isLoading)
            Text(isLoading ? .shimmeringString : "@\(data.userName)")
                .font(
                    .workSans(
                        type: .regular,
                        size: .small
                    )
                )
                .foregroundColor(isLoading ? .clear : .gray)
                .shimmering(isLoading)
        }
    }
}

#Preview {
    UserItemView(
        data: .init(
            name: "Mas Jan Cook",
            userName: "jancook",
            photo: nil
        ),
        isLoading: true
    )
    .padding(.horizontal)

}
