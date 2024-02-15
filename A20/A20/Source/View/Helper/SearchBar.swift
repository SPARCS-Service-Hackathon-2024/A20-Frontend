//
//  SearchBar.swift
//  A20
//
//  Created by 드즈 on 2/15/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 331, height: 48)
                .cornerRadius(12)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            HStack(spacing: 10) {
                Image("Search")
                    .resizable()
                    .frame(width: 24, height: 24)
                TextField("구 단위로 검색해주세요!", text: $text)
                    .frame(width: 253, height: 24)
            }
        }
    }
}

#Preview {
    SearchBar()
}
