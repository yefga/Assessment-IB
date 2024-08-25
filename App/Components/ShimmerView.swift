//
//  ShimmerView.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import SwiftUI

struct ShimmerEffect: View {
    @State private var shimmerOffset: CGFloat = -0.25
    
    var body: some View {
        GeometryReader { geometry in
            Color.gray.opacity(0.3)
                .overlay(
                    Color.white.opacity(0.6)
                        .mask(
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(stops: [
                                        .init(color: .clear, location: shimmerOffset - 0.2),
                                        .init(color: .white, location: shimmerOffset),
                                        .init(color: .clear, location: shimmerOffset + 0.2)
                                    ]), startPoint: .leading, endPoint: .trailing)
                                )
                        )
                )
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        shimmerOffset = 1.25
                    }
                }
        }
    }
}

struct ShimmeringModifier: ViewModifier {
    let isShimmering: Bool
    
    func body(content: Content) -> some View {
        if isShimmering {
            content
                .overlay(ShimmerEffect())
                .disabled(true)
        } else {
            content
        }
    }
}

extension View {
    func shimmering(_ active: Bool = true) -> some View {
        modifier(ShimmeringModifier(isShimmering: active))
    }
}
