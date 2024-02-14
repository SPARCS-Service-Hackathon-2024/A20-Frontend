//
//  Background.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 41, height: 41)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 1)
                
            )
    }
}

#Preview {
    Background()
}
