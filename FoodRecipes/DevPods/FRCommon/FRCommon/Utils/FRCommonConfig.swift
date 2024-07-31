//
//  FRCommonConfig.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public class FRCommonConfig {
    private init() {}

    public static let shared = FRCommonConfig()
    public var enableDebugView: Bool = false

    public func loadConfig() {
        LanguageLocal.shared.loadLanguage()
    }
}
