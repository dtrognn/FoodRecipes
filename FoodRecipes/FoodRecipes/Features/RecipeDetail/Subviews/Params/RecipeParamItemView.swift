//
//  RecipeParamItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import FRCommon
import SwiftUI

struct RecipeParamItemView: View {
    private var description: String
    private var value: String

    init(description: String, value: String) {
        self.description = description
        self.value = value
    }

    var body: some View {
        VStack(spacing: AppStyle.layout.smallSpace) {
            valueText
            descriptionText
        }
    }
}

private extension RecipeParamItemView {
    var valueText: some View {
        return Text(value)
            .font(AppStyle.font.medium16)
            .foregroundStyle(AppStyle.theme.textHightlightColor)
    }

    var descriptionText: some View {
        return Text(description)
            .font(AppStyle.font.medium16)
            .foregroundStyle(AppStyle.theme.textNoteColor)
    }
}
