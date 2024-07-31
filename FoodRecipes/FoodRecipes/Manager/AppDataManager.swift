//
//  AppDataManager.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

final class AppDataManager {
    static var shared = AppDataManager()

    let appLanguage: AppLanguage

    init() {
        appLanguage = AppLanguage()
    }
}
