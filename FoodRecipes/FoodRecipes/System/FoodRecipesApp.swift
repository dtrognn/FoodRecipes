//
//  FoodRecipesApp.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI
import FRCommon

@main
struct FoodRecipesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var languageManager = LanguageManager.shared

    var body: some Scene {
        WindowGroup {
            AppRouterView()
                .environment(\.locale, .init(identifier: self.languageManager.currentLanguage.getLanguageCode()))
        }
    }
}
