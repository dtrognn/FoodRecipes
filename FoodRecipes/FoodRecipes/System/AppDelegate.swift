//
//  AppDelegate.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        AppConfigurationManager.shared.loadModuleConfig()

        return true
    }
}