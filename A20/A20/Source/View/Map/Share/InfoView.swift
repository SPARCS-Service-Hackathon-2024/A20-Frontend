//
//  InfoView.swift
//  A20
//
//  Created by 현채정 on 2/15/24.
//

import SwiftUI

struct InfoView: View {
//    @EnvironmentObject var shareViewModel: ShareViewModel
    
    @State var selectedOption: Int = 0
    
    @State private var lenderName: String = ""
    @State private var phoneNumber: String = ""
    @State private var address: String = ""
    @State private var parking: String = ""
    
    @State private var moveToNextPage: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        Text("기본 정보를 입력해주세요!")
                            .font(
                                Font.custom("PretendardVariable", size: 15)
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
                            TextField("성함", text: $lenderName)
                                .font(Font.custom("PretendardVariable", size: 15))
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
                                .font(Font.custom("PretendardVariable", size: 15))
                                .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                                .frame(width: 300)
                        }.padding(.bottom, 32)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 375, height: 12)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }.padding(.bottom, 32)
                        
                        Text("주차장 장소")
                            .font(
                                Font.custom("PretendardVariable", size: 15)
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
                            TextField("주소를 입력해주세요", text: $address)
                                .font(Font.custom("PretendardVariable", size: 15))
                                .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                                .frame(width: 300)
                        }.padding(.bottom, 12)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                .cornerRadius(8)
                            TextField("주차장 이름을 입력해주세요", text: $parking)
                                .font(Font.custom("PretendardVariable", size: 15))
                                .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                                .frame(width: 300)
                        }.padding(.bottom, 32)
                        
                    }
                    VStack {
                        VStack {
                            Text("주차장 소유관계")
                                .font(Font.custom("PretendardVariable", size: 16).weight(.medium))
                                .lineSpacing(16)
                                .foregroundColor(.black)
                                .frame(width: 331, alignment: .topLeading)
                        }
                        
                        VStack {
                            HStack {
                                ZStack {
                                    RadioButton(index: 1, selectedIndex: $selectedOption)
                                }
                                .frame(width: 20, height: 20)
                                Text("소유주")
                                    .font(Font.custom("PretendardVariable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 300, alignment: .topLeading)
                            }
                            
                            HStack {
                                ZStack {
                                    RadioButton(index: 2, selectedIndex: $selectedOption)
                                }
                                .frame(width: 20, height: 20)
                                Text("임차인 (주차권한보유) 또는 직원")
                                    .font(Font.custom("PretendardVariable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 300, alignment: .topLeading)
                            }
                            
                            HStack {
                                ZStack {
                                    RadioButton(index: 3, selectedIndex: $selectedOption)
                                }
                                .frame(width: 20, height: 20)
                                Text("관리자")
                                    .font(Font.custom("PretendardVariable", size: 14))
                                    .lineSpacing(14)
                                    .foregroundColor(.black)
                                    .frame(width: 300, alignment: .topLeading)
                            }
                        }
                    }
                    .frame(width: 211, height: 110)
                    .padding(.bottom, 32)
                    
                    Button {
                        if !lenderName.isEmpty && !phoneNumber.isEmpty && !address.isEmpty && !parking.isEmpty {
                            //                        shareViewModel.lenderName = self.lenderName
                            //                        shareViewModel.phoneNumber = self.phoneNumber
                            //                        shareViewModel.address = self.address
                            //                        shareViewModel.parkingLotName = self.parkingLotName
                            //                        shareViewModel.relation = self.relation
                            moveToNextPage = true
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(!lenderName.isEmpty && !phoneNumber.isEmpty && !address.isEmpty && !parking.isEmpty ? Color.mainColor : Color.lightGray)
                                .cornerRadius(8)
                            Text("다음")
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
            .edgesIgnoringSafeArea(.bottom)
        }
        .toolbarBackground(Color.white, for: .navigationBar)
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
        .navigationDestination(isPresented: $moveToNextPage, destination: {
            TimeView()
//                .environmentObject(shareViewModel)
        })
    }
}

#Preview {
    InfoView()
}
