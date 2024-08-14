//
//  AppConfigurationManager.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation
import FRCommon
import FRCore
import Combine

final class AppConfigurationManager {
    static let shared = AppConfigurationManager()

    private var cancellableSet: Set<AnyCancellable> = []

    private init() {}

    func loadCommonConfig() {
        loadModuleConfig()
        AppDataManager.shared.appLanguage.loadLanguage()

        configureLoading()
        configureAlertMessage()

        LanguageManager.shared.onChangeLanguage.sink { _ in

        }.store(in: &cancellableSet)
    }

    private func loadModuleConfig() {
        FRCommonConfig.shared.loadConfig()
        APIConfig.shared.configure(baseUrl: URLEnvironment(url: DefineConfiguration.baseUrl, apiKey: DefineConfiguration.apiKey))
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
