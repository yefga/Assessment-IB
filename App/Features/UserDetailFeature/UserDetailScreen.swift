//
//  UserDetailScreen.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct UserDetailScreen: View {
    var user: User
    var profileImage: Data?
    
    @Environment(\.dismiss) var dismiss
    var Header: some View {
        ZStack(alignment: .trailing) {
            HStack {
                Spacer()
                Text("Profile")
                    .font(.workSans(type: .semiBold, size: .semiLarge))
                Spacer()
                
                
            }
            CirclePlaceholderView(type: .icon(name: "icon_close"))
                .frame(width: 40, height: 40)
                .onTapGesture {
                    dismiss()
                }
        }
       
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .padding(.horizontal, 20)
        .overlay(
            Rectangle()
                .fill(.black)
                .frame(height: 1)
                .offset(y: 1/2),
            alignment: .bottom
        )
    }
    
    @ViewBuilder
    var SetImage: some View {
        if let data = user.image {
            CirclePlaceholderView(
                type: .uiImage(UIImage(data: data))
            )
        } else {
            CirclePlaceholderView(type: .loader)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Header
          
            ScrollView {
                VStack(spacing: 20) {
                    SetImage
                        .frame(width: 250, height: 250)
                        .padding(.bottom, 10)
                    Text(user.name.orValue(.emptyString))
                        .font(.workSans(type: .semiBold, size: .large))
                    UserInformation
                        .padding(.horizontal, 18)
                        .padding(.vertical, 24)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 10
                            ).stroke(Color.gray, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
            }           
        }
    }
    
    var UserInformation: some View {
        VStack(alignment: .leading, spacing: 10) {
            UserDetailDataView(
                title: "Username",
                description: user.username.orValue(.emptyString)
            )
            UserDetailDataView(
                title: "email",
                description: user.email.orValue(.emptyString)
            )
            UserDetailDataView(
                title: "address",
                description: user.address.orValue(.emptyString)
            )
            UserDetailDataView(
                title: "phone",
                description: user.phone.orValue(.emptyString)
            )
            UserDetailDataView(
                title: "Website",
                description: user.website.orValue(.emptyString)
            )
        }
    }
    
    private func UserDetailDataView(title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 37) {
            Text(title.uppercased())
                .font(.workSans(type: .semiBold, size: .medium))
                .frame(width: 100, alignment: .leading)
            Text(description)
                .font(.workSans(type: .regular, size: .medium))
        }
    }
}

#Preview {
    UserDetailScreen(
        user: .init(
            id: 1,
            name: "Mas Jan Cook",
            username: "jancook",
            email: "jancook@gmail.com",
            address: "Jl. Bukit Golf Internasional GB3, Lakarsantri, Kec. Lakarsantri, Surabaya, Jawa Timur",
            phone: "+627128378913",
            website: "jancook.com",
            company: "Jan Cook, LLC"
        )
    ).previewLayout(.sizeThatFits)
}
