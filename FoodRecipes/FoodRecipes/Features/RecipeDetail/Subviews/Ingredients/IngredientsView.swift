//
//  IngredientsView.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import FRCommon
import SwiftUI

struct IngredientsView: View {
    private var ingredients: [IngredientItemData]

    init(_ ingredients: [IngredientItemData]) {
        self.ingredients = ingredients
    }

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            HStack(spacing: AppStyle.layout.zero) {
                ingredientsText
                Spacer()
                numberOfIngredientsText
            }

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: AppStyle.layout.mediumSpace) {
                    ForEach(ingredients) { ingredient in
                        IngredientItemView(ingredient)
                    }
                }
            }
        }
    }
}

private extension IngredientsView {
    var ingredientsText: some View {
        return Text(language("Recipe_Detail_A_07"))
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var numberOfIngredientsText: some View {
        return Text(String(format: "%d %@", ingredients.count, language("Recipe_Detail_A_08")))
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNoteColor)
    }
}
