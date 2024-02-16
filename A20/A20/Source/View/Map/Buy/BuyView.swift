//
//  BuyView.swift
//  A20
//
//  Created by 현채정 on 2/15/24.
//

import SwiftUI

struct BuyView: View {
    @State private var clickBuy: Bool = false
    @EnvironmentObject var shareViewModel: ShareViewModel
    
    @State private var borrowerName: String = ""
    @State private var phoneNumber: String = ""
    @State private var carType: String = ""
    @State private var carNumber: String = ""
    @State private var borrowStartTime: String = ""
    @State private var borrowEndTime: String = ""
    
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
                        
                        //여기부터 picker 부분
                        HStack {
                            VStack{
                                ZStack {
//                                    Picker("Select Time", selection: $borrowStartTime) {
//                                        ForEach(0..<25) { hour in
//                                            Text("\(hour)").tag(hour)
//                                        }
//                                    }
//                                    .pickerStyle(.wheel)
//                                    .onChange(of: borrowStartTime) { newHour, _ in
//                                        // Update the displayed text when borrowStartTime changes
//                                        // and store the selected number in borrowStartTime
//                                        // Text view is now used within the ZStack
//                                    }
//                                    .frame(width: 137, height: 40, alignment: .leading)
//                                    .background(Color.white)
//                                    .cornerRadius(8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .inset(by: 0.50)
//                                            .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
//                                    )
//                                    .foregroundColor(Color.black)
//                                    
//                                    Text(" \(borrowStartTime)")
//                                    Picker("Select a paint color", selection: $borrowStartTime) {
//                                        ForEach(0..<25, id: \.self) {
//                                            Text($0)
//                                        }
//                                    }
//                                    .pickerStyle(MenuPickerStyle())
//                                    .background(Color.white)  // Set white background
//                                    .border(Color.black, width: 1)  // Set black border
//                                    .frame(width: 137, height: 40)  // Set frame size
//                                    .overlay(
//                                        Image(systemName: "chevron.down")
//                                            .foregroundColor(.black)
//                                            .padding(.trailing, 8)  // Adjust the padding as needed
//                                            .frame(alignment: .trailing)
//                                    )

//                                    Text("Selected Color: \(selection)")
//                                        .padding()
                                }
                            }
                                    
                                Spacer()
                                
                                Text("~")
                                    .font(Font.custom("Pretendard Variable", size: 20))
                                    .foregroundColor(.black)
                                
                                Text(" \(borrowEndTime)")
                                    .padding()
                                Picker("Select Time", selection: $borrowEndTime) {
                                    ForEach(0..<25) { hour in
                                        Text("\(hour)").tag(hour)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
//                                .onChange(of: borrowEndTime) { newValue in
//                                    // Update the Text view when borrowEndTime changes
//                                    Text("\(newValue)").padding()
//                                }
                                .frame(width: 137, height: 40, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.50)
                                        .stroke(Color(red: 0.69, green: 0.69, blue: 0.69), lineWidth: 0.50)
                                )
                                .foregroundColor(Color.black)
                            }.padding(.bottom, 32)
                    }
                    //여기까지
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 375, height: 12)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    }.padding(.bottom, 32)
                    
                    Button {
//                        if !borrowerName.isEmpty && !phoneNumber.isEmpty && !carType.isEmpty && !carNumber.isEmpty && !borrowStartTime.isEmpty && !borrowEndTime.isEmpty {
//                            print("go to next page")
//                            shareViewModel.borrowerName = self.borrowerName
//                            shareViewModel.borrowerPhoneNumber = self.phoneNumber
//                            shareViewModel.carType = self.carType
//                            shareViewModel.carNumber = self.carNumber
//                            shareViewModel.borrowStartTime = self.borrowStartTime
//                            shareViewModel.borrowEndTime = self.borrowEndTime
//                            clickBuy = true
//                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(!borrowerName.isEmpty && !phoneNumber.isEmpty && !carType.isEmpty && !carNumber.isEmpty && !borrowStartTime.isEmpty && !borrowEndTime.isEmpty ? Color.mainColor : Color.lightGray)
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
                    .padding(.top, 32)
                    .padding(.bottom, 200)
                }
            }
        }
        //        .toolbarBackground(Color.white, for: .navigationBar)
//        .navigationBarBackButtonHidden(true)
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
