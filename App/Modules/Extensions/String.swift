//
//  String.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import Foundation

extension String {
    static var emptyString: String {
        ""
    }
    static var shimmeringString: String {
        "Long text for Shimmering"
    }
}

extension Optional where Wrapped == String {
    func orValue(_ value: String) -> String {
        return self ?? value
    }
}
