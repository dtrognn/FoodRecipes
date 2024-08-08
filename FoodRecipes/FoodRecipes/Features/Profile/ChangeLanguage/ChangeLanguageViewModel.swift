//
//  ChangeLanguageViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 8/8/24.
//

import SwiftUI
import FRCommon

class ChangeLanguageViewModel: BaseViewModel {
    @Published var languages: [LanguageItemData] = []

    private let languageManager = LanguageManager.shared

    override func makeSubscription() {
        languageManager.onChangeLanguage.sink { [weak self] _ in
            self?.initData()
        }.store(in: &cancellableSet)
    }

    override func initData() {
        let languageCodeCurrent = languageManager.currentLanguage
        languages = [
            LanguageItemData(id: UUID().uuidString,
                             leftImage: Image("ic_language"),
                             title: language("Language_A_04"),
                             value: .system,
                             isSelected: languageCodeCurrent == .system,
                             onSelect: { code in
                                 LanguageManager.shared.setLanguage(code)
                             }),
            LanguageItemData(id: UUID().uuidString,
                             leftImage: Image("ic_lang_vn"),
                             title: language("Language_A_02"),
                             value: .vi,
                             isSelected: languageCodeCurrent == .vi,
                             onSelect: { code in
                                 self.languageManager.setLanguage(code)
                             }),
            LanguageItemData(id: UUID().uuidString,
                             leftImage: Image("ic_lang_en"),
                             title: language("Language_A_03"),
                             value: .en,
                             isSelected: languageCodeCurrent == .en,
                             onSelect: { code in
                                 self.languageManager.setLanguage(code)
                             })
        ]
    }
}
