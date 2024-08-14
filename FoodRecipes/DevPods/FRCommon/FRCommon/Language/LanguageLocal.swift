//
//  LanguageLocal.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation

class LanguageLocal {
    static let shared = LanguageLocal()
    var bundleLanguage: Bundle = .frCommonResourceBundle()
    private var cancellableSet: Set<AnyCancellable> = []

    private init() {
        LanguageManager.shared.onChangeLanguageBundle.sink { [weak self] _ in
            self?.loadLanguage()
        }.store(in: &cancellableSet)
    }

    func loadLanguage(languageCode: String? = nil) {
        let languageCodeCurrent = languageCode == nil ? LanguageManager.shared.currentLanguage.getLanguageCode() : languageCode!

        if let path = Bundle.frCommonResourceBundle().path(forResource: languageCodeCurrent, ofType: "lproj") {
            bundleLanguage = Bundle(path: path)!
        }
    }
}

func language(_ keyLanguage: String) -> String {
    return NSLocalizedString(keyLanguage, bundle: LanguageLocal.shared.bundleLanguage, comment: "")
}
