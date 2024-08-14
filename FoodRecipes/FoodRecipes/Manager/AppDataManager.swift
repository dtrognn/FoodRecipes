//
//  AppDataManager.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

final class AppDataManager {
    static var shared = AppDataManager()

    var authServiceManager: AuthServiceManager
    let appState: AppState
    let appLanguage: AppLanguage

    init() {
        authServiceManager = AuthServiceManager.share

        AuthServiceManager.share.loadUser()

        appState = AppState()
        appLanguage = AppLanguage()
    }

    var isLogout: Bool {
        return !appState.loginState.loggedIn
    }
}
