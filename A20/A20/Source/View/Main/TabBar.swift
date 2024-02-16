//
//  TabBar.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct TabBar: View {
    @State private var showMainView = false
    
    @State private var selectedTab = 0
    
    @State var isLogin: Bool = false
    
    @EnvironmentObject var locationManager: LocationManager
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $selectedTab) {
//                    AroundView(locationManager: $locationManager)
                    MapView()
                        .environmentObject(mapViewModel)
                        .environmentObject(locationManager)
                        .environmentObject(loginViewModel)
                        .tabItem {
                            Label {
                                Text("주변")
                                    .font(
                                        Font.custom("PretendardVariable", size: 12)
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
                                        Font.custom("PretendardVariable", size: 12)
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
                    
                    ChatView()
                        .environmentObject(loginViewModel)
                        .tabItem {
                            Label {
                                Text("챗봇")
                                    .font(
                                        Font.custom("PretendardVariable", size: 12)
                                            .weight(.bold)
                                    )
                                    .kerning(0.1)
                            } icon: {
                                if selectedTab == 2 {
                                    Image("ChatBotOn")
                                } else {
                                    Image("ChatBotOff")
                                }
                            }
                        }
                        .tag(2)
                    
                    Color.clear
                        .tabItem {
                            Label {
                                Text("마이페이지")
                                    .font(
                                        Font.custom("PretendardVariable", size: 12)
                                            .weight(.bold)
                                    )
                                    .kerning(0.1)
                            } icon: {
                                if selectedTab == 3 {
                                    Image("MypageOff")
                                        .foregroundColor(.mainColor)
                                } else {
                                    Image("MypageOff")
                                }
                            }
                        }
                        .tag(3)
                }
                .accentColor(selectedTab == 3 ? Color(hex: "#c3c3c3") : .mainColor)
                
                if !isLogin {
                    Start(isLogin: $isLogin)
                        .environmentObject(loginViewModel)
                }
                
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
            Color.white.ignoresSafeArea()
            Image("Logo")
        }
    }
}

//#Preview {
//    TabBar()
//}
