//
//  AppDelegate.swift
//  SchemeDemo
//
//  Created by Ibrahim Mo Gedami on 2/17/24.
// PRODUCT_NAME

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = AuthConfiguration.login.viewController
        let navigation = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }

}

