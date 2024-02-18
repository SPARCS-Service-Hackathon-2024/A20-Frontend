//  TimeView.swift
//  A20
//
//  Created by 현채정 on 2/15/24.
//

import SwiftUI

struct TimeView: View {
    @EnvironmentObject var shareViewModel: ShareViewModel
    
    @State private var totalQty: String = ""
    @State private var operDay: [String] = [""]
    
    @State private var baseRate: String = ""
    @State private var bTime: String = ""
    @State private var baTime: String = ""
    @State private var basTime: String = ""
    @State private var baseTime: String = ""
    
    @State private var addRate: String = ""
    @State private var addTime: String = ""
    
    @State private var openTime: String = ""
    @State private var closeTime: String = ""
    
    @State private var success: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack {
                    VStack {
                        Text("총 주차 공간")
                            .font(
                                Font.custom("PretendardVariable", size: 16)
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
                                .foregroundColor(.black)
                                .frame(width: 300)
                        }.padding(.bottom, 32)
                        
                        Text("운영 시간")
                            .font(
                                Font.custom("PretendardVariable", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 331, alignment: .topLeading)
                            .padding(.bottom, 16)
                        
                        ForEach(operDay.indices, id: \.self) { index in
                            HStack {
                                HStack(spacing: 10) {
                                    TextField("00", text: $baseTime)
                                        .font(Font.custom("PretendardVariable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(.black)
                                }
                                .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                .frame(width: 42, height: 48)
                                .background(.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.50)
                                        .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                )
                                
                                Text("~")
                                    .font(Font.custom("PretendardVariable", size: 20))
                                    .foregroundColor(.black)
                                
                                
                                HStack(spacing: 10) {
                                    TextField("00", text: $basTime)
                                        .font(Font.custom("PretendardVariable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(.black)
                                }
                                .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                .frame(width: 42, height: 48)
                                .background(.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.50)
                                        .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                )
                                
                                HStack(spacing: 10) {
                                    TextField("0000", text: $baTime)
                                        .font(Font.custom("PretendardVariable", size: 16))
                                        .lineSpacing(16)
                                        .foregroundColor(.black)
                                }
                                .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
                                .frame(width: 127, height: 48)
                                .background(.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.50)
                                        .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                )
                                .padding(.leading, 14)
                                
                                Text("시")
                                    .font(Font.custom("PretendardVariable", size: 20))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Button(action: {
                                    // Add a new row
                                    operDay.append("")
                                }) {
                                    Image("Btn")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.blue)
                                }
                            }
                            .frame(width: 331, height: 50)
                            .padding(.bottom, 16)
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("0000")
                                .font(Font.custom("PretendardVariable", size: 16).weight(.bold))
                                .lineSpacing(16)
                                .foregroundColor(.black)
                            HStack(alignment: .top, spacing: 29) {
                                HStack(spacing: 6) {
                                    HStack(spacing: 6) {
                                        HStack(spacing: 4) {
                                            HStack(spacing: 10) {
                                                TextField("00", text: $bTime)
                                                    .font(Font.custom("PretendardVariable", size: 16))
                                                    .lineSpacing(16)
                                                    .foregroundColor(.black)
                                                Text("분")
                                                    .font(Font.custom("PretendardVariable", size: 16))
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
                                            .font(Font.custom("PretendardVariable", size: 16))
                                            .lineSpacing(16)
                                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                    }
                                }
                                HStack(spacing: 6) {
                                    HStack(spacing: 6) {
                                        HStack(spacing: 4) {
                                            HStack(spacing: 10) {
                                                TextField("00", text: $baseRate)
                                                    .font(Font.custom("PretendardVariable", size: 16))
                                                    .lineSpacing(16)
                                                    .foregroundColor(.black)
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
                                            .font(Font.custom("PretendardVariable", size: 16))
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
                                .font(Font.custom("PretendardVariable", size: 16).weight(.medium))
                                .lineSpacing(16)
                                .foregroundColor(.black)
                            HStack(alignment: .top, spacing: 29) {
                                HStack(spacing: 6) {
                                    HStack(spacing: 6) {
                                        HStack(spacing: 4) {
                                            HStack(spacing: 10) {
                                                TextField("00", text: $addTime)
                                                    .font(Font.custom("PretendardVariable", size: 16))
                                                    .lineSpacing(16)
                                                    .foregroundColor(Color.black)
                                                Text("분")
                                                    .font(Font.custom("PretendardVariable", size: 16))
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
                                            .font(Font.custom("PretendardVariable", size: 16))
                                            .lineSpacing(16)
                                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                    }
                                }
                                HStack(spacing: 6) {
                                    HStack(spacing: 6) {
                                        HStack(spacing: 4) {
                                            HStack(spacing: 10) {
                                                TextField("00", text: $addRate)
                                                    .font(Font.custom("PretendardVariable", size: 16))
                                                    .lineSpacing(16)
                                                    .foregroundColor(.black)
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
                                            .font(Font.custom("PretendardVariable", size: 16))
                                            .lineSpacing(16)
                                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                    }
                                }
                            }
                        }
                        .frame(width: 331, height: 72)
                        .padding(.bottom, 32)
                        
                        Button {
                            //                        if !totalQty.isEmpty && !baseRate.isEmpty && !baseTime.isEmpty && !addTime.isEmpty && !addRate.isEmpty && !operDay.isEmpty {
                            // API Request
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                success = true
                            }
                            //                        }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 331, height: 56)
                                    .background(!baseRate.isEmpty && !baseTime.isEmpty && !addTime.isEmpty && !addRate.isEmpty ? Color.mainColor : Color.lightGray)
                                    .cornerRadius(8)
                                Text("등록하기")
                                    .font(
                                        Font.custom("PretendardVariable", size: 15)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    if success {
                        Color.black.opacity(0.8)
                            .ignoresSafeArea()
                        // GIF
                        VStack {
                            Text("등록 완료!")
                                .font(
                                    Font.custom("PretendardVariable", size: 26)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width: 126, height: 157)
                    }
                }
            }
        }
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
