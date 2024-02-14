//
//  OnBoarding.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct OnBoarding: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var carType: String = ""
    @State private var carNumber: String = ""
    
    @State private var next: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("환영해요!\n로그인해주세요")
                    .font(
                        Font.custom("Pretendard", size: 30)
                            .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 280, alignment: .topLeading)
                    .padding(.bottom, 32)
                
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
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 56)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                        .cornerRadius(8)
                    TextField("차량번호가 무엇인가요?", text: $carNumber)
                        .font(Font.custom("Pretendard", size: 15))
                        .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                        .frame(width: 300)
                }
                
                Button {
                    next = true
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 56)
                            .background(Color.mainColor)
                            .cornerRadius(8)
                        Text("다음")
                            .font(
                                Font.custom("Urbanist", size: 15)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 32)
            }
        }
//        .toolbarBackground(Color.white, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationBarItems(trailing: Text("SKIP")
            .font(
                Font.custom("Pretendard", size: 15)
                    .weight(.semibold)
            )
                .kerning(0.15)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0, green: 0.09, blue: 0.21)))
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

#Preview {
    OnBoarding()
}
