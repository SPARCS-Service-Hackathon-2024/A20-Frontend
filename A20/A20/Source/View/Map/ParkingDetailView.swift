//
//  ParkingDetailView.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct ParkingDetailView: View {
    var body: some View {
        NavigationStack {
            
        }
//        .toolbarBackground(Color.white, for: .navigationBar)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: BackButton())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("주차장 상세")
                    .font(
                        Font.custom("Pretendard", size: 16)
                            .weight(.bold)
                    )
            }
        }
    }
}

#Preview {
    ParkingDetailView()
}
