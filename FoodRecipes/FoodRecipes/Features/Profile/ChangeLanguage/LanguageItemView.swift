//
//  LanguageItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 8/8/24.
//

import FRCommon
import SwiftUI

struct LanguageItemData: Identifiable {
    var id: String = UUID().uuidString
    var leftImage: Image?
    var title: String = ""
    var value: LanguageCode = .system
    var isSelected: Bool = false
    var onSelect: (LanguageCode) -> Void
}

struct LanguageItemView: View {
    var data: LanguageItemData

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            data.onSelect(data.value)
        } label: {
            VStack(spacing: AppStyle.layout.zero) {
                HStack(spacing: AppStyle.layout.standardSpace) {
                    HStack(spacing: AppStyle.layout.standardSpace) {
                        leftImage
                        languageText
                    }

                    Spacer()
                    checkmarkImage
                }.padding(.vertical, AppStyle.layout.standardSpace)
                StraightLine()
            }.padding(.horizontal, AppStyle.layout.standardSpace)
        }.background(AppStyle.theme.rowCommonBackgroundColor)
    }
}

private extension LanguageItemView {
    var leftImage: some View {
        if let image = data.leftImage {
            return image
//                .resizable()
//                .frame(width: 32, height: 32)
                .asAnyView
        }
        return EmptyView().asAnyView
    }

    var languageText: some View {
        return Text(data.title)
            .foregroundColor(AppStyle.theme.textNormalColor)
            .font(AppStyle.font.regular16)
    }

    var checkmarkImage: some View {
        return Image(systemName: "checkmark")
            .resizable()
            .applyTheme()
            .frame(width: 16, height: 14)
            .hidden(!data.isSelected)
    }
}
