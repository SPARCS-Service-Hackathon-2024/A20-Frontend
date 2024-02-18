//
//  Login.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var success: Bool = false
    @State private var onBoard: Bool = false
    
    @State private var needRegist: Bool = false
    
    @Binding var isLogin: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("환영해요!\n로그인해주세요")
                    .font(
                        Font.custom("PretendardVariable", size: 30)
                            .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 331, alignment: .topLeading)
                    .padding(.bottom, 32)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 56)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                        .cornerRadius(8)
                    TextField("이메일을 입력해주세요", text: $email)
                        .font(Font.custom("PretendardVariable", size: 15))
                        .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                        .frame(width: 300)
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 56)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                        .cornerRadius(8)
                    TextField("비밀번호 입력해주세요", text: $password)
                        .font(Font.custom("PretendardVariable", size: 15))
                        .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                        .frame(width: 300)
                }
                
                Button {
                    if !email.isEmpty && !password.isEmpty {
                        print("start login")
                        loginViewModel.email = self.email
                        loginViewModel.password = self.password
                        Task {
                            do {
                                try await loginViewModel.login()
                                if !loginViewModel.login.token.isEmpty {
                                    onBoard = true
                                }
                            } catch {
                                print("Error fetching data: \(error)")
                            }
                        }
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 56)
                            .background(!email.isEmpty && !password.isEmpty ? Color.mainColor : Color.lightGray)
                            .cornerRadius(8)
                        Text("로그인")
                            .font(
                                Font.custom("PretendardVariable", size: 15)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 32)
                .padding(.bottom, 225)
                
                Text("회원이 아니신가요?")
                    .font(Font.custom("PretendardVariable", size: 15))
                    .kerning(0.15)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                Button {
                    needRegist = true
                } label: {
                    Text("1분만에 회원가입하기")
                        .font(
                            Font.custom("Pretendard", size: 15)
                                .weight(.semibold)
                        )
                        .kerning(0.15)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
            }
        }
        .navigationDestination(isPresented: $needRegist, destination: {
            Regist(isLogin: $isLogin)
                .environmentObject(loginViewModel)
        })
        .navigationDestination(isPresented: $onBoard, destination: {
            OnBoarding(isLogin: $isLogin)
                .environmentObject(loginViewModel)
        })
        //        .toolbarBackground(Color.white, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

//#Preview {
//    Login()
//}
