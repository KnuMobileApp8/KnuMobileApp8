//
//  KnuMobileApp8App.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/03.
//

import SwiftUI
import FirebaseCoreInternal
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var authViewModel = AuthViewModel() // Create an instance of AuthViewModel as a @StateObject
    @StateObject private var displayModel = DisplayModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AuthView()
                    .environmentObject(authViewModel)
            }
            .environmentObject(displayModel)
        }
    }
}
