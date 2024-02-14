//
//  WriteView.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct WriteView: View {
    @State private var writeContent: String = ""
    @State private var writeTitle: String = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Text("신고 목적")
                      .font(
                        Font.custom("Pretendard Variable", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                    Spacer()
                }
                
                
                HStack {
                    Text("사진")
                      .font(
                        Font.custom("Pretendard Variable", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: 331)
                
                ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 80)
                            .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                            .cornerRadius(8)
                    HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 58, height: 58)
                                    .foregroundColor(.text)
                                    .cornerRadius(12)
                                Image("camera")
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                Text("TIP")
                                    .font(
                                        Font.custom("Pretendard Variable", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                Text("최대 10장까지 첨부가 가능해요!")
                                    .font(
                                        Font.custom("Pretendard Variable", size: 12)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            }
                        }
                }
                
                HStack {
                    Text("게시물 작성")
                      .font(
                        Font.custom("Pretendard Variable", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: 331)
                
                ZStack {
                    TextField("제목을 입력해주세요", text: $writeTitle)
                        .frame(width: 331, alignment: .topLeading)
                            .padding(18)
                            .background(
                                Color.textField
                                    .frame(width: 331, height: 56)
                                    .cornerRadius(8)
                            )
//                    TextField("제목을 입력해주세요", text: $writeTitle)
//                        .frame(width: 284, height: 18, alignment: .leading)
//                        .background(
//                            Color.textField
//                                .frame(width: 331, height: 56)
//                                .cornerRadius(8)
//                        )
                }
                .padding(.bottom, 25)
                
                ZStack {
                    TextField("게시판 내용을 입력해주세요", text: $writeContent)
                        .frame(width: 331, alignment: .topLeading)
                            .padding(18)
                            .background(
                                Color.textField
                                    .frame(width: 331, height: 241)
                                    .cornerRadius(8)
                            )
                }
                .padding(.top, 50)
                
            }
            .frame(width: 331)
            //            .toolbarBackground(Color.white, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("글쓰기")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.bold)
                        )
                }
            }
        }
    }
}

#Preview {
    WriteView()
}
