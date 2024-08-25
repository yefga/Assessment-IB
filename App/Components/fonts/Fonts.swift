//
//  Fonts.swift
//  AppTests
//
//  Created by Yefga on 25/08/24.
//

import Foundation
import SwiftUI

public enum FontSize: CGFloat {
    case small = 12.0
    case medium = 16.0
    case semiLarge = 20.0
    case large = 32.0
}

public enum FontType: String {
    case semiBold = "WorkSans-SemiBold"
    case regular = "WorkSans-Regular"
}

public extension Font {
    static func workSans(type: FontType, size: FontSize) -> Font {
        Font.custom(type.rawValue, size: size.rawValue)
    }
}
