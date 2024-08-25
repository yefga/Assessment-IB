//
//  SearchView.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    var onSearch: ((String) -> Void)?
    enum Field {
        case name
    }
    @FocusState private var focus: Field?
    
    var body: some View {
        HStack(spacing: 8) {
            TextField("Search", text: $searchText)
                .submitLabel(.done)
                .focused($focus, equals: .name)
                .onChange(of: searchText) { text in
                    onSearch?(text)
                }
                .onSubmit {
                    onSearch?(searchText)
                }
                .showClearButton($searchText)
                .font(.workSans(type: .regular, size: .medium))
                .padding(
                    EdgeInsets(
                        top: 12,
                        leading: 20,
                        bottom: 12,
                        trailing: 20
                    )
                )
                .background(Color.white)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .shadow(
                    color: Color(
                        #colorLiteral(
                            red: 1.0,
                            green: 0.9,
                            blue: 0.8,
                            alpha: 1.0
                        )
                    ),
                    radius: 5,
                    x: 0,
                    y: 3
                )
                
            

            CirclePlaceholderView(
                type: .icon(name: "icon_magnifier")
            )
                .frame(width: 40, height: 40)
                .onTapGesture {
                    onSearch?(searchText)
                }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewLayout(.sizeThatFits)
            .padding(20)
    }
}
