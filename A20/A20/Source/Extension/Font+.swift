//
//  Font+.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

extension Font {
    static func customFont(name: String, size: CGFloat) -> Font {
        guard let customFont = UIFont(name: name, size: size) else {
            return Font.system(size: size)
        }
        let font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        return Font(font)
    }
}
