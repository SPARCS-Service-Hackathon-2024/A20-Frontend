//
//  TabBar.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct TabBar: View {
//    @StateObject var loginViewModel
    
    @State private var showMainView = false
    
    @State private var selectedTab = 0
    
    @Binding var isLogin: Bool
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
//    @StateObject var loginViewModel: LoginViewModel = LoginViewModel(registDataString: LoginResponse(user: User(name: "", email: "", password: "", id: ""), token: ""), loginDataString: LoginResponse(user: User(name: "", email: "", password: "", id: ""), token: ""))
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $selectedTab) {
                    AroundView()
                        .environmentObject(loginViewModel)
                        .tabItem {
                            Label {
                                Text("주변")
                                    .font(
                                        Font.custom("Pretendard", size: 12)
                                            .weight(.bold)
                                    )
                                    .kerning(0.1)
                            } icon: {
                                if selectedTab == 0 {
                                    Image("AroundOn")
                                } else {
                                    Image("AroundOff")
                                }
                            }
                        }
                        .tag(0)
                    
                    CommunityView()
                        .environmentObject(loginViewModel)
                        .tabItem {
                            Label {
                                Text("커뮤니티")
                                    .font(
                                        Font.custom("Pretendard", size: 12)
                                            .weight(.bold)
                                    )
                                    .kerning(0.1)
                            } icon: {
                                if selectedTab == 1 {
                                    Image("CommunityOn")
                                } else {
                                    Image("CommunityOff")
                                }
                            }
                        }
                        .tag(1)
                    
                    ChatBotView()
                        .environmentObject(loginViewModel)
                        .tabItem {
                            Label {
                                Text("챗봇")
                                    .font(
                                        Font.custom("Pretendard", size: 12)
                                            .weight(.bold)
                                    )
                                    .kerning(0.1)
                            } icon: {
                                if selectedTab == 2 {
                                    Image("ChatbotOn")
                                } else {
                                    Image("ChatbotOff")
                                }
                            }
                        }
                        .tag(2)
                    
                    MyPageView()
                        .environmentObject(loginViewModel)
                        .tabItem {
                            Label {
                                Text("마이페이지")
                                    .font(
                                        Font.custom("Pretendard", size: 12)
                                            .weight(.bold)
                                    )
                                    .kerning(0.1)
                            } icon: {
                                if selectedTab == 3 {
                                    Image("MypageOn")
                                } else {
                                    Image("MypageOff")
                                }
                            }
                        }
                        .tag(3)
                }
                .accentColor(.mainColor)
                
//                if next {
//                    Start()
//                        .environmentObject(loginViewModel)
//                }
                
                if !showMainView {
                    splash
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                    withAnimation {
                        showMainView = true
//                    }
                }
            }
            
        }
    }
}

extension TabBar {
    var splash: some View {
        ZStack {
            Color.mainColor.ignoresSafeArea()
        }
    }
}

//#Preview {
//    TabBar()
//}
