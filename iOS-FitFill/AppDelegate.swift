//
//  AppDelegate.swift
//  iOS-FitFill
//
//  Created by IFang Lee on 2020/8/2.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureInitialViewController()
        
        return true
    }
}

// MARK: - Helper Functions
private extension AppDelegate {
    
    func configureInitialViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController.storyboardInit()
        window?.makeKeyAndVisible()
    }
}

