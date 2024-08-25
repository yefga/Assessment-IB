//
//  Colors.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import Foundation
import SwiftUI

extension Color {
    static var background: String {
        "#F9F5F2"
    }
    static var black100: String {
        "#000000"
    }
    static var white100: String {
        "#FFFFFF"
    }
    static var overlay: String {
        "#F8D0AB"
    }
}

extension String {
    var colorFormat: Color {
        let hex = trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard let int = Int(hex, radix: 16) else { return .clear }

        let (r, g, b, a): (Double, Double, Double, Double)
        switch hex.count {
        case 3:
            (r, g, b, a) = (
                Double((int >> 8) * 17) / 255,
                Double((int >> 4 & 0xF) * 17) / 255,
                Double((int & 0xF) * 17) / 255,
                1.0
            )
        case 6:
            (r, g, b, a) = (
                Double(int >> 16 & 0xFF) / 255,
                Double(int >> 8 & 0xFF) / 255,
                Double(int & 0xFF) / 255,
                1.0
            )
        case 8:
            (r, g, b, a) = (
                Double(int >> 16 & 0xFF) / 255,
                Double(int >> 8 & 0xFF) / 255,
                Double(int & 0xFF) / 255,
                Double(int >> 24 & 0xFF) / 255
            )
        default:
            return .clear
        }

        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

