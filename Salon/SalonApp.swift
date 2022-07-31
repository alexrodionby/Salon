//
//  SalonApp.swift
//  Salon
//
//  Created by Alexandr Rodionov on 30.07.22.
//

import SwiftUI
import FirebaseCore

@main
struct SalonApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LogoView()
        }
    }
}

// from firebase install method
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
