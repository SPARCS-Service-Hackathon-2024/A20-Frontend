//
//  Font+.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

extension Font {
    static func customFont(name: String, size: CGFloat, weight: Font.Weight = .regular) -> Font {
        guard let uiFont = UIFont(name: name, size: size) else {
            return Font.system(size: size, weight: weight)
        }
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        let scaledUIFont = fontMetrics.scaledFont(for: uiFont)
        
        return Font(scaledUIFont).weight(weight)
    }
}

// CALL
// ex. 다대슈
//.font(
//    Font.customFont(name: "PretendardVariable", size: 48, weight: .heavy)
//)
