//
//  Color+.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    static let mainColor = Color(hex: "#575DFB")
    static let subColor = Color(hex: "#E2E1FF")
    static let dark = Color(hex: "#1E232C")
    static let border = Color(hex: "#E8ECF4")
    static let gray = Color(hex: "#8391A1")
    static let lightGray = Color(hex: "#7A7A7A")
    static let darkGray = Color(hex: "#6A707C")
    static let background = Color(hex: "#F9FAFB")
    static let Gray = Color(hex: "#f9fafb")
    static let text = Color(hex: "#bfbfc3")
    static let textField = Color(hex: "#f7f8f9")
}

//extension UIColor {
//    static let mainColor = UIColor(named: "main")
//}
