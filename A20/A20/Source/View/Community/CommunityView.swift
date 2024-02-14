//
//  CommunityView.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct CommunityView: View {
    @State private var index = 0
    
    var array: [String] = ["1", "2", "3"]
    
    var body: some View {
        NavigationStack {
            if index == 0 {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(array, id: \.self) { index in
                            VStack {
                                HStack {
                                    ZStack {
                                        Image("OnSubmit")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipped()
                                            .cornerRadius(113.94936)
    //                                    VStack {
    //                                        Spacer()
    //                                        HStack {
    //                                            Spacer()
    //                                            ZStack {
    //                                                Circle()
    //                                                    .frame(width: 20, height: 20)
    //                                                    .foregroundColor(Color(red: 1, green: 0.77, blue: 0.16))
    //                                                Text("5.0")
    //                                                    .font(
    //                                                        Font.custom("Pretendard Variable", size: 8.56)
    //                                                            .weight(.semibold)
    //                                                    )
    //                                                    .multilineTextAlignment(.center)
    //                                                    .foregroundColor(.white)
    //                                                    .frame(width: 15, height: 15)
    //                                            }
    //                                        }
    //                                    }
    //                                    .frame(width: 50, height: 50)
                                    }
                                    .padding(.trailing, 20)
                                    VStack(alignment: .leading) {
                                        Text("홍길동")
                                        Text("15/02/2024")
                                    }
                                    Spacer()
                                }
                                HStack {
                                                                    Text("세모주차장")
                                                                        .font(
                                                                            Font.custom("Pretendard Variable", size: 15)
                                                                                .weight(.semibold)
                                                                        )
                                                                        .foregroundColor(.black)
                                                                    Spacer()
                                                                }
                                                                .padding(.top, 25)
                                                                
                                                                HStack {
                                                                    Image("Location")
                                                                        .frame(width: 25, height: 25)
                                                                    Text("대전시 유성구 123가 123길")
                                                                      .font(Font.custom("Pretendard Variable", size: 14))
                                                                      .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                                                                    Spacer()
                                                                }
                                                                .padding(.bottom, 15)
                                                                
                                                                HStack {
                                                                    Text("Lorem ipsum")
                                                                        .multilineTextAlignment(.leading)
                                                                    Spacer()
                                                                }
                            }
                            .padding(.vertical, 15)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9 /* 325 */)
                .background(Color.red)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                WriteView()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.white)
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Image("write")
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(.vertical, 25)
                            .padding(.horizontal, 25)
                        }
                        HStack(spacing: 0) {
                            HStack{
                                Text("신고 내용")
                                    .font(
                                        Font.custom("Pretendard Variable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(self.index == 0 ? .white : Color.mainColor)
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 0 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 0
                            }
                            
                            HStack {
                                Text("주차장 후기")
                                    .font(
                                        Font.custom("Pretendard Variable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(self.index == 1 ? .white : Color.mainColor)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 1 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 1
                            }
                        }
                        .padding(3)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding(.bottom)
                }
                //            .toolbarBackground(Color.white, for: .navigationBar)
                //            .navigationBarBackButtonHidden(true)
                //            .navigationBarItems(leading: BackButton())
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("커뮤니티")
                            .font(
                                Font.custom("Pretendard", size: 16)
                                    .weight(.bold)
                            )
                    }
                }
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(array, id: \.self) { index in
                            VStack {
                                HStack {
                                    ZStack {
                                        Image("OnSubmit")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipped()
                                            .cornerRadius(113.94936)
                                        VStack {
                                            Spacer()
                                            HStack {
                                                Spacer()
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 20, height: 20)
                                                        .foregroundColor(Color(red: 1, green: 0.77, blue: 0.16))
                                                    Text("5.0")
                                                        .font(
                                                            Font.custom("Pretendard Variable", size: 8.56)
                                                                .weight(.semibold)
                                                        )
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(.white)
                                                        .frame(width: 15, height: 15)
                                                }
                                            }
                                        }
                                        .frame(width: 50, height: 50)
                                    }
                                    .padding(.trailing, 20)
                                    VStack(alignment: .leading) {
                                        Text("홍길동")
                                        Text("15/02/2024")
                                    }
                                    Spacer()
                                }
                                HStack {
                                                                    Text("세모주차장")
                                                                        .font(
                                                                            Font.custom("Pretendard Variable", size: 15)
                                                                                .weight(.semibold)
                                                                        )
                                                                        .foregroundColor(.black)
                                                                    Spacer()
                                                                }
                                                                .padding(.top, 25)
                                                                
                                                                HStack {
                                                                    Image("Location")
                                                                        .frame(width: 25, height: 25)
                                                                    Text("대전시 유성구 123가 123길")
                                                                      .font(Font.custom("Pretendard Variable", size: 14))
                                                                      .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                                                                    Spacer()
                                                                }
                                                                .padding(.bottom, 15)
                                                                
                                                                HStack {
                                                                    Text("Lorem ipsum")
                                                                        .multilineTextAlignment(.leading)
                                                                    Spacer()
                                                                }
                            }
                            .padding(.vertical, 15)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9 /* 325 */)
                .background(Color.red)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                WriteView()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.white)
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Image("write")
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(.vertical, 25)
                            .padding(.horizontal, 25)
                        }
                        HStack(spacing: 0) {
                            HStack{
                                Text("신고 내용")
                                    .font(
                                        Font.custom("Pretendard Variable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(self.index == 0 ? .white : Color.mainColor)
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 0 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 0
                            }
                            
                            HStack {
                                Text("주차장 후기")
                                    .font(
                                        Font.custom("Pretendard Variable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(self.index == 1 ? .white : Color.mainColor)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 1 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 1
                            }
                        }
                        .padding(3)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding(.bottom)
                }
                //            .toolbarBackground(Color.white, for: .navigationBar)
                //            .navigationBarBackButtonHidden(true)
                //            .navigationBarItems(leading: BackButton())
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("커뮤니티")
                            .font(
                                Font.custom("Pretendard", size: 16)
                                    .weight(.bold)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}
