//
//  AppConfigurationManager.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation
import FRCommon

final class AppConfigurationManager {
    static let shared = AppConfigurationManager()

    private init() {}

    func loadModuleConfig() {
        FRCommonConfig.shared.loadConfig()
    }
}
