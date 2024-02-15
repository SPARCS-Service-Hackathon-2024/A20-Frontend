//
//  ParkingShareButton.swift
//  A20
//
//  Created by 드즈 on 2/15/24.
//

import SwiftUI

struct ParkingShare: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 156, height: 40)
                .cornerRadius(12)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            HStack(spacing: 5) {
                Image("ParkingLocation")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("내 주차장 공유하기")
                  .font(Font.custom("PretendardVariable", size: 12))
                    .frame(width: 102, height: 24)
            }
        }
    }
}

#Preview {
    ParkingShare()
}
