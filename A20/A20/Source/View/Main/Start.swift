//
//  Start.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct Start: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 125, height: 91)
                        .background(
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 91)
                                .clipped()
                        )
                    
                    Text("다대슈")
                        .font(
                            Font.custom("Pretendard", size: 48)
                                .weight(.heavy)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.34, green: 0.37, blue: 0.98))
                    
                    Text("주정차 문제 해결 한번에")
                        .font(
                            Font.custom("Pretendard", size: 17)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    NavigationLink {
                        Login()
                            .environmentObject(loginViewModel)
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(Color(red: 0.34, green: 0.37, blue: 0.98))
                                .cornerRadius(8)
                            Text("로그인")
                                .font(
                                    Font.custom("Urbanist", size: 15)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                    }
                    
                    NavigationLink {
                        Regist()
                            .environmentObject(loginViewModel)
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 331, height: 56)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.34, green: 0.37, blue: 0.98), lineWidth: 1)
                                )
                            Text("회원가입")
                                .font(
                                    Font.custom("Urbanist", size: 15)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.mainColor)
                        }
                    }
            }
        }
    }
}

//#Preview {
//    Start()
//}
