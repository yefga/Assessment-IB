//
//  TopBottomBorder.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct TopBottomBorder: ViewModifier {
    let color: Color
    let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .offset(y: -width/2),
                alignment: .top
            )
            .overlay(
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .offset(y: width/2),
                alignment: .bottom
            )
    }
}

extension View {
    func topBottomBorder(color: Color, width: CGFloat) -> some View {
        self.modifier(TopBottomBorder(color: color, width: width))
    }
}
