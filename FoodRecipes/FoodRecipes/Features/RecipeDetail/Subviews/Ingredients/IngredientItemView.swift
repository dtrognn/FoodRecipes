//
//  IngredientItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import FRCommon
import SwiftUI

struct IngredientItemView: View {
    private var ingredient: IngredientItemData

    init(_ ingredient: IngredientItemData) {
        self.ingredient = ingredient
    }

    var body: some View {
        VStack(spacing: AppStyle.layout.standardSpace) {
            ingredientImage
            VStack(spacing: AppStyle.layout.smallSpace) {
                ingredientNameText
                servingText
            }
        }
    }
}

private extension IngredientItemView {
    var ingredientImage: some View {
        return ImageUrl(urlString: ingredient.getImageUrl()) {
            ProgressView().applyTheme()
        }.frame(width: 50, height: 50)
            .applyShadowView()
    }

    var ingredientNameText: some View {
        return Text(ingredient.getDisplayName())
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var servingText: some View {
        let amount = ingredient.measures.us.amount
        let unit = ingredient.measures.us.unitShort
        return Text(String(format: "%.1f %@", amount, unit))
            .font(AppStyle.font.medium14)
            .foregroundStyle(AppStyle.theme.textNoteColor)
    }
}
