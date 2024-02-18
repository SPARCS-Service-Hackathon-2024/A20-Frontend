//
//  BuyView.swift
//  A20
//
//  Created by 현채정 on 2/15/24.
//

import SwiftUI

struct BuyView: View {
    @EnvironmentObject var shareViewModel: ShareViewModel
    
    @State private var clickBuy: Bool = false
    @State private var borrowerName: String = ""
    @State private var phoneNumber: String = ""
    @State private var carType: String = ""
    @State private var carNumber: String = ""
    @State private var borrowStartTime: Int = 0
    @State private var borrowEndTime: String = ""
    
    var numberList: [Int] = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("기본 정보를 입력해주세요!")
                        .font(
                            Font.custom("Pretendard", size: 15)
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
                        TextField("성함", text: $borrowerName)
                            .font(Font.custom("Pretendard", size: 15))
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                            .frame(width: 300)
                    }.padding(.bottom, 12)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 56)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                        TextField("연락처를 입력해주세요!", text: $phoneNumber)
                            .font(Font.custom("Pretendard", size: 15))
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                            .frame(width: 300)
                    }.padding(.bottom, 32)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 375, height: 12)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    }.padding(.bottom, 32)
                    
                    Text("차량 정보를 입력해주세요!")
                        .font(
                            Font.custom("Pretendard", size: 15)
                                .weight(.bold)
                        )
                        .foregroundColor(.black)
                        .frame(width: 331, alignment: .topLeading)
                        .padding(.bottom, 14)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 56)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                        TextField("차종이 무엇인가요?", text: $carType)
                            .font(Font.custom("Pretendard", size: 15))
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                            .frame(width: 300)
                    }.padding(.bottom, 12)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 56)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                        TextField("차량 번호가 무엇인가요?", text: $carNumber)
                            .font(Font.custom("Pretendard", size: 15))
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                            .frame(width: 300)
                    }.padding(.bottom, 32)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 375, height: 12)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    }.padding(.bottom, 32)
                    
                    VStack {
                        Text("대여 예정시간")
                            .font(
                                Font.custom("Pretendard", size: 15)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 331, alignment: .topLeading)
                            .padding(.bottom, 16)
                        
                        HStack {
                            VStack{
                                Menu {
                                    Picker("", selection: $borrowStartTime) {
                                        ForEach(numberList, id: \.self) {
                                            Text("\($0)")
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Text(borrowStartTime == 0 ? "시간당" : "\(borrowStartTime)")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 97, height: 14)
                                    .padding(10)
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(.gray, lineWidth: 1)
                                )
                            }
                            
                            Text("~")
                                .font(Font.custom("Pretendard Variable", size: 20))
                                .foregroundColor(.black)
                                .padding(.horizontal, 20)
                            
                            Menu {
                                Picker("", selection: $borrowStartTime) {
                                    ForEach(numberList, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(borrowStartTime == 0 ? "시간당" : "\(borrowStartTime)")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.black)
                                }
                                .frame(width: 97, height: 14)
                                .padding(10)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        }
                        .padding(.bottom, 32)
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 375, height: 12)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    }
                    .padding(.bottom, 32)
                    
                    Button {
                        if !borrowerName.isEmpty && !phoneNumber.isEmpty && !carType.isEmpty && !carNumber.isEmpty && borrowStartTime != 0 && !borrowEndTime.isEmpty {
                            // API Reqeust
                            clickBuy = true
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(!borrowerName.isEmpty && !phoneNumber.isEmpty && !carType.isEmpty && !carNumber.isEmpty && borrowStartTime != 0 && !borrowEndTime.isEmpty ? Color.mainColor : Color.lightGray)
                                .cornerRadius(8)
                            Text("구매하기")
                                .font(
                                    Font.custom("Urbanist", size: 15)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
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
    BuyView()
}
