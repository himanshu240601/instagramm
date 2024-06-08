//
//  InstagrammApp.swift
//  Instagramm
//
//  Created by Himanshu's MacBook on 08/06/24.
//

import SwiftUI

@main
struct InstagrammApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - App Delegate

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        sleep(2)
        return true
    }
}
