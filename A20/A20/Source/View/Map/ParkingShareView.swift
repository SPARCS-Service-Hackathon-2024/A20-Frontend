//
//  ShareView.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
//            .toolbarBackground(Color.white, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("내 주차장 공유하기")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.bold)
                        )
                }
            }
        }
    }
}

#Preview {
    ShareView()
}
