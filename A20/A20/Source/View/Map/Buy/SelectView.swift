//
//  SelectView.swift
//  A20
//
//  Created by 현채정 on 2/16/24.
//

import SwiftUI

struct SelectView: View {
    @EnvironmentObject var shareViewModel: ShareViewModel
    
    @State private var parkingLotName: String = ""
    @State private var address: String = ""
    @State private var operDay: [String] = []
    
    @State private var moveToNextPage: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    //variable을 사용
                    Text("세모네모 주차장")
                        .font(Font.custom("Pretendard", size: 20).weight(.bold))
                        .tracking(0.10)
                        .foregroundColor(.black)
                        .frame(width: 331, alignment: .topLeading)
                        .padding(.top, 42)
                        .padding(.bottom, 4)
                    
                    HStack {
                        ZStack {
                            HStack(spacing: 10) {
                                Image("Location")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(.leading, 0)
                                    .padding(.trailing, 0)
                            }
                        }
                        .padding(.leading, 25)
                        
                        Text("대전시 유성구 123가 123길")
                            .font(Font.custom("Pretendard", size: 14))
                            .tracking(0.10)
                            .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                            .frame(width: 331, alignment: .topLeading)
                    }.padding(.bottom, 27.5)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 375, height: 12)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    }.padding(.bottom, 24)
                    
                    Text("시간 요금")
                        .font(Font.custom("Pretendard Variable", size: 14).weight(.bold))
                        .lineSpacing(14)
                        .foregroundColor(Color(red: 0.34, green: 0.37, blue: 0.98))
                        .frame(width: 331, alignment: .topLeading)
                        .padding(.bottom, 17)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 23) {
                            HStack(alignment: .top, spacing: 13) {
                                Text("기본 요금")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 134, alignment: .leading)
                                Text("30분당 3,000원")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 283)
                            HStack(alignment: .top, spacing: 13) {
                                Text("추가 요금")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 134, alignment: .leading)
                                Text("10분당 1,000원")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 283)
                        }
                    }
                    .padding(24)
                    .frame(width: 331, height: 103)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(12)
                    
                    Text("유료 운영 시간")
                        .font(Font.custom("Pretendard Variable", size: 14).weight(.bold))
                        .lineSpacing(14)
                        .foregroundColor(Color(red: 0.34, green: 0.37, blue: 0.98))
                        .frame(width: 331, alignment: .topLeading)
                        .padding(.top, 24)
                        .padding(.bottom, 17)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 23) {
                            HStack(alignment: .top, spacing: 13) {
                                Text("평일")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 134, alignment: .leading)
                                Text("00:00~24:00")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 283)
                            HStack(alignment: .top, spacing: 13) {
                                Text("주말")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 134, alignment: .leading)
                                Text("00:00~24:00")
                                    .font(Font.custom("Pretendard Variable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 283)
                        }
                    }
                    .padding(24)
                    .frame(width: 331, height: 103)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(12)
                    
                    Button {
                        //                        if !parkingLotName.isEmpty && !address.isEmpty && !operDay.isEmpty {
                        //                            print("go to buy page")
                        //                            shareViewModel.parkingLotName = self.parkingLotName
                        //                            shareViewModel.address = self.address
                        //                            shareViewModel.operDay = self.operDay
                        moveToNextPage = true
                        //                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(Color(red: 0.34, green: 0.37, blue: 0.98))
                                .cornerRadius(8)
                            Text("구매하기")
                                .font(
                                    Font.custom("PretendardVariable", size: 15)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 200)
                }
            }
        }
        //        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $moveToNextPage) {
            BuyView()
        }
    }
}

#Preview {
    SelectView()
}
