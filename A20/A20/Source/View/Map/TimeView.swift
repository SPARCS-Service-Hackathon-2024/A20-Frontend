//  TimeView.swift
//  A20
//
//  Created by 현채정 on 2/15/24.
//

import SwiftUI

struct TimeView: View {
    @EnvironmentObject var shareViewModel: ShareViewModel
    
    @State private var totalQty: String = ""
    @State private var operDay: [String] = []
    
    @State private var baseRate: String = ""
    @State private var baseTime: String = ""
    
    @State private var addRate: String = ""
    @State private var addTime: String = ""
    
    @State private var openTime: String = ""
    @State private var closeTime: String = ""
    
    @State private var registerParkingLot: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("총 주차 공간")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.bold)
                        )
                        .foregroundColor(.black)
                        .frame(width: 331, alignment: .topLeading)
                        .padding(.top, 42)
                        .padding(.bottom, 16)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 56)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                        TextField("차량 몇 대가 주차 가능한지 작성해 주세요", text: $totalQty)
                            .font(Font.custom("Pretendard", size: 15))
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                            .frame(width: 300)
                    }.padding(.bottom, 32)
                    
                    Text("운영 시간")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.bold)
                        )
                        .foregroundColor(.black)
                        .frame(width: 331, alignment: .topLeading)
                        .padding(.bottom, 16)
                    
//                    ForEach(operDay.indices, id: \.self) { index in
//                        HStack {
//                            Picker("Day", selection: $operDay[index]) {
//                                ForEach(["월", "화", "수", "목", "금", "토", "일"], id: \.self) { day in
//                                    Text(day).tag(day)
//                                }
//                            }
//                            .pickerStyle(.menu)
//                            .frame(width: 60)
//
//                            Text("~")
//                                .font(Font.custom("Pretendard Variable", size: 20))
//                                .foregroundColor(.black)
//
//                            TextField("Start Time", text: $openTime)
//                                .font(Font.custom("Pretendard", size: 15))
//                                .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
//                                .frame(width: 80)
//
//                            Text("시")
//                                .font(Font.custom("Pretendard Variable", size: 20))
//                                .foregroundColor(.black)
//
//                            Spacer()
//
//                            Button(action: {
//                                // Add a new row
//                                operDay.append("")
//                            }) {
//                                Image(systemName: "plus.circle")
//                                    .resizable()
//                                    .frame(width: 24, height: 24)
//                                    .foregroundColor(.blue)
//                            }
//                        }
//                        .padding(.bottom, 16)
//                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("기본 요금")
                            .font(Font.custom("Pretendard Variable", size: 16).weight(.bold))
                            .lineSpacing(16)
                            .foregroundColor(.black)
                        HStack(alignment: .top, spacing: 29) {
                            HStack(spacing: 6) {
                                HStack(spacing: 6) {
                                    HStack(spacing: 4) {
                                        HStack(spacing: 10) {
                                            TextField("00", text: $baseTime)
                                                .font(Font.custom("Pretendard Variable", size: 16))
                                                .lineSpacing(16)
                                                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                                            Text("분")
                                                .font(Font.custom("Pretendard Variable", size: 16))
                                                .lineSpacing(16)
                                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                        }
                                        .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                        .frame(width: 124, height: 40)
                                        .background(.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .inset(by: 0.50)
                                                .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                        )
                                    }
                                    Text("까지")
                                        .font(Font.custom("Pretendard Variable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                }
                            }
                            HStack(spacing: 6) {
                                HStack(spacing: 6) {
                                    HStack(spacing: 4) {
                                        HStack(spacing: 10) {
                                            TextField("00", text: $baseRate)
                                                .font(Font.custom("Pretendard Variable", size: 16))
                                                .lineSpacing(16)
                                                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                                        }
                                        .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                        .frame(width: 124, height: 40)
                                        .background(.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .inset(by: 0.50)
                                                .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                        )
                                    }
                                    Text("원")
                                        .font(Font.custom("Pretendard Variable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                }
                            }
                        }
                    }
                    .frame(width: 331, height: 72)
                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("추가 요금")
                            .font(Font.custom("Pretendard Variable", size: 16).weight(.medium))
                            .lineSpacing(16)
                            .foregroundColor(.black)
                        HStack(alignment: .top, spacing: 29) {
                            HStack(spacing: 6) {
                                HStack(spacing: 6) {
                                    HStack(spacing: 4) {
                                        HStack(spacing: 10) {
                                            TextField("00", text: $addTime)
                                                .font(Font.custom("Pretendard Variable", size: 16))
                                                .lineSpacing(16)
                                                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                                            Text("분")
                                                .font(Font.custom("Pretendard Variable", size: 16))
                                                .lineSpacing(16)
                                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                        }
                                        .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                        .frame(width: 124, height: 40)
                                        .background(.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .inset(by: 0.50)
                                                .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                        )
                                    }
                                    Text("까지")
                                        .font(Font.custom("Pretendard Variable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                }
                            }
                            HStack(spacing: 6) {
                                HStack(spacing: 6) {
                                    HStack(spacing: 4) {
                                        HStack(spacing: 10) {
                                            TextField("00", text: $addRate)
                                                .font(Font.custom("Pretendard Variable", size: 16))
                                                .lineSpacing(16)
                                                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                                        }
                                        .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                        .frame(width: 124, height: 40)
                                        .background(.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .inset(by: 0.50)
                                                .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                        )
                                    }
                                    Text("원")
                                        .font(Font.custom("Pretendard Variable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                }
                            }
                        }
                    }
                    .frame(width: 331, height: 72)
                    .padding(.bottom, 106)
                    
                    Button {
//                        if !totalQty.isEmpty && !baseRate.isEmpty && !baseTime.isEmpty && !addTime.isEmpty && !addRate.isEmpty && !operDay.isEmpty {
//                            print("register parking lot")
//                            shareViewModel.totalQty = self.totalQty
//                            shareViewModel.baseRate = self.baseRate
//                            shareViewModel.baseTime = self.baseTime
//                            shareViewModel.addTime = self.addTime
//                            shareViewModel.addRate = self.addRate
//                            registerParkingLot = true
//                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(!totalQty.isEmpty && !baseRate.isEmpty && !baseTime.isEmpty && !addTime.isEmpty && !addRate.isEmpty && !operDay.isEmpty ? Color(red: 0.34, green: 0.37, blue: 0.98) : Color.lightGray)
                                .cornerRadius(8)
                            Text("등록하기")
                              .font(
                                Font.custom("Urbanist", size: 15)
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
//        .toolbarBackground(Color.white, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("내 주차장 공유하기")
                    .font(
                        Font.custom("PretendardVariable", size: 16)
                            .weight(.bold)
                    )
            }
        }
    }
}

#Preview {
    TimeView()
}
