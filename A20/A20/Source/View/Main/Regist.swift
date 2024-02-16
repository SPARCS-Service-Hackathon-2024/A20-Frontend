//
//  Regist.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct Regist: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var success: Bool = false
    @State private var onBoard: Bool = false
    
    @State private var alreadyLogin: Bool = false
    
    @Binding var isLogin: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("회원가입을 위해\n작성해주세요!")
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
                    TextField("이름을 입력해주세요", text: $name)
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
                    if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                        print("start register")
                        loginViewModel.name = self.name
                        loginViewModel.email = self.email
                        loginViewModel.password = self.password
                        Task {
                            do {
                                try await loginViewModel.regist()
                                onBoard = true
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
                            .background(!name.isEmpty && !email.isEmpty && !password.isEmpty ? Color.mainColor : Color.lightGray)
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
                .padding(.bottom, 200)
                
                Text("이미 회원이신가요?")
                  .font(Font.custom("PretendardVariable", size: 15))
                  .kerning(0.15)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black)
                
                Button {
                    alreadyLogin = true
                } label: {
                    Text("로그인하러가기")
                      .font(
                        Font.custom("PretendardVariable", size: 15)
                          .weight(.semibold)
                      )
                      .kerning(0.15)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                }
            }
        }
        .navigationDestination(isPresented: $alreadyLogin, destination: {
            Login(isLogin: $isLogin)
                .environmentObject(loginViewModel)
        })
        .navigationDestination(isPresented: $onBoard, destination: {
            OnBoarding(isLogin: $isLogin)
                .environmentObject(loginViewModel)
        })
        //            .toolbarBackground(Color.white, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

//#Preview {
//    Regist()
//}
