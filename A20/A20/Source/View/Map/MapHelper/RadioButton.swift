//
//  RadioButtonView.swift
//  A20
//
//  Created by 현채정 on 2/16/24.
//

import SwiftUI

struct RadioButton: View {
    var index: Int
    @Binding var selectedIndex: Int

    var body: some View {
        Button(action: {
            selectedIndex = index
        }) {
            HStack {
                Image(systemName: self.selectedIndex == self.index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                Text("Option \(index)")
            }
        }
    }
}

