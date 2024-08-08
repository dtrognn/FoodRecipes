//
//  ChangeLanguageView.swift
//  FoodRecipes
//
//  Created by dtrognn on 8/8/24.
//

import FRCommon
import SwiftUI

struct ChangeLanguageView: View {
    @StateObject private var vm = ChangeLanguageViewModel()

    private var screenConfiguration: ScreenConfiguration {
        return .init(
            title: language("Language_A_01"),
            showBackButton: true,
            showNaviBar: true
        )
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                LazyVStack(spacing: AppStyle.layout.zero) {
                    ForEach(vm.languages) { language in
                        LanguageItemView(data: language)
                    }
                }.background(AppStyle.theme.rowCommonBackgroundColor)
                    .cornerRadius(AppStyle.layout.standardSpace)
                    .applyShadowView()
            }.padding(.all, AppStyle.layout.standardSpace)
        }.environment(\.locale, .init(identifier: LanguageManager.shared.currentLanguage.getLanguageCode()))
    }
}

#Preview {
    ChangeLanguageView()
}
