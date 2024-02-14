//
//  AppDelegate.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

//import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//
//}
//



//import Foundation
//import UIKit
//import KakaoSDKCommon
//import KakaoSDKAuth
//import UserNotifications
//
////@main
//class AppDelegate: UIResponder, UIApplicationDelegate /*, NSObject */ {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?/* = nil*/) -> Bool {
//        
//        // Override point for customization after application launch.
////        guard let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_APP_KEY") as? String else {
////            return
////        }
////        KakaoSDK.initSDK(appKey: kakaoAppKey)
//        
//        // Request Notification Authorization
//        UNUserNotificationCenter.current().delegate = self
//        
//        // Notification Authorization Options
//        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//        UNUserNotificationCenter.current().requestAuthorization(
//            options: authOptions,
//            completionHandler: { allowed, _ in
//                if allowed {
//                    appStatusChecking()
//                }
//            }
//        )
//        
//        return true
//    }
//    
//    // MARK: UISceneSession(Scene-Based) Lifecycle (before iOS 13)
//    
////    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
////        if (AuthApi.isKakaoTalkLoginUrl(url)) {
////            return AuthController.handleOpenUrl(url: url)
////        }
////        return false
////    }
//    
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
////        // Called when a new scene session is being created.
////        // Use this method to select a configuration to create the new scene with.
////        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//        
//        let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
//        sceneConfiguration.delegateClass = SceneDelegate.self
//        return sceneConfiguration
//    }
//    
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//}
//
//extension AppDelegate: UNUserNotificationCenterDelegate {
//    // Set Notifications on Foreground
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        // Call Haptic
//        HapticHelper.shared.impact(style: .medium)
//        completionHandler([.list, .banner])
//    }
//}
