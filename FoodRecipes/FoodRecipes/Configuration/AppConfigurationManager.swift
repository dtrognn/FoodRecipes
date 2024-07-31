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

    func loadCommonConfig() {
        loadModuleConfig()

        configureLoading()
        configureAlertMessage()
    }

    func loadModuleConfig() {
        FRCommonConfig.shared.loadConfig()
    }

    private func configureLoading() {
        let defaultConfig = DefaultLoadingConfiguration()
        defaultConfig.configure()
        LoadingConfiguration.shared.addLoadingConfiguration(loadingType: .defaultLoading, loading: defaultConfig)
    }

    private func configureAlertMessage() {
        let defaultConfig = DefaultAlertMessageConfiguration()
        defaultConfig.configure()
        AlertMessageConfiguration.shared.addAlertMessage(.defaultAlert, alertMessage: defaultConfig)

        let bannerConfig = BannerAlertMessageConfiguration()
        bannerConfig.configure()
        AlertMessageConfiguration.shared.addAlertMessage(.banner, alertMessage: bannerConfig)
    }
}
