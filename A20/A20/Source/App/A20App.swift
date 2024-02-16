//
//  A20App.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

@main
struct A20App: App {
    
//    @State
    
//    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    
    // @StateObject var loginViewModel = LoginViewModel() ViewModel들의 @StateObject 변수들을 모두 여기서 한번에 정의하고, 하위 뷰에서 자유롭게 @EnvironmentObject var loginViewModel: LoginViewModel 와 같은 형식으로 정의하여 사용합니다.
    
    @StateObject var locationManager = LocationManager()
    
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel(registDataString: LoginResponse(user: User(name: "", email: "", password: "", id: ""), token: ""), loginDataString: LoginResponse(user: User(name: "", email: "", password: "", id: ""), token: ""))
    @StateObject var mapViewModel: MapViewModel = MapViewModel(parkingInfoDataString: ParkingInfo(), parkingDetailDataString: ParkingDetail(name: "", lat: "", lon: "", address: "", tel: "", totalQty: "", resQty: "", type: "", baseTime: "", baseRate: "", addTime: "", addRate: "", extraBaseTime: "", extraAddTime: "", extraAddRate: "", weekdayOpenTime: "", weekdayCloseTime: "", operDay: "", id: ""))
    
    init() {
        // Customed NaivagationBar BackgroundColor
        let appearanceOfNavigationBar = UINavigationBarAppearance()
        
        appearanceOfNavigationBar.configureWithOpaqueBackground()
        appearanceOfNavigationBar.backgroundColor = UIColor.white
        appearanceOfNavigationBar.shadowColor = UIColor.clear
        
        UINavigationBar.appearance().tintColor = .clear
        
        // (If) Scroll Appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceOfNavigationBar
        // Standard Appearance
        UINavigationBar.appearance().standardAppearance = appearanceOfNavigationBar
        
        // Customed TabBar BackgroundColor
        let appearanceOfTabBar = UITabBarAppearance()
        
        appearanceOfTabBar.configureWithOpaqueBackground()
        appearanceOfTabBar.backgroundColor = UIColor.white
        appearanceOfTabBar.shadowColor = UIColor.clear
        
        UITabBar.appearance().tintColor = .clear
        UITabBar.appearance().standardAppearance = appearanceOfTabBar
        UITabBar.appearance().layer.masksToBounds = false
        UITabBar.appearance().layer.shadowColor = UIColor.black.cgColor
        UITabBar.appearance().layer.shadowOpacity = 0.25
        UITabBar.appearance().layer.shadowOffset = CGSize(width: 0, height: 0)
        UITabBar.appearance().layer.shadowRadius = 5
        
        // (If) Scroll Appearance
        UITabBar.appearance().scrollEdgeAppearance = appearanceOfTabBar
        // Standard Appearance
        UITabBar.appearance().standardAppearance = appearanceOfTabBar
        
        // MARK: Page Tab View PageControl appearance Settings!
//        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.main
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor.grey
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabBar()
                    .environmentObject(locationManager)
                    .environmentObject(loginViewModel)
                    .environmentObject(mapViewModel)
            }
        }
    }
}
