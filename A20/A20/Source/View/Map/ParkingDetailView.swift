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
//            ScrollView {
            VStack(spacing: 15) {
                HStack {
                    VStack {
                        Text("세모 주차장")
                            .font(
                                Font.custom("PretendardVariable", size: 20)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                
                HStack {
                    Image("Location")
                    Text("대전시 유성구 123가 123길")
                      .font(Font.custom("PretendardVariable", size: 14))
                      .foregroundColor(.lightGray)
                    Spacer()
                    
                    
                }
                
                HStack {
                    Text("민영주차장")
                        .font(Font.custom("PretendardVariable", size: 14))
                        .foregroundColor(.lightGray)
                    Spacer()
                }
                HStack {
                    Text("운영중(자정에 마감)")
                        .font(Font.custom("PretendardVariable", size: 14))
                        .foregroundColor(.lightGray)
                    Spacer()
                }
                HStack {
                    Text("시간당 1,500원(주차요금)")
                        .font(Font.custom("PretendardVariable", size: 14))
                        .foregroundColor(.lightGray)
                    Spacer()
                }
                HStack {
                    Text("24자리 남음")
                        .font(Font.custom("PretendardVariable", size: 14))
                        .foregroundColor(.lightGray)
                    Spacer()
                }

            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(Color.red)
//            }
        }
//        .toolbarBackground(Color.white, for: .navigationBar)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: BackButton())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("주차장 상세")
                    .font(
                        Font.custom("PretendardVariable", size: 16)
                            .weight(.bold)
                    )
            }
        }
    }
}

#Preview {
    ParkingDetailView()
}
