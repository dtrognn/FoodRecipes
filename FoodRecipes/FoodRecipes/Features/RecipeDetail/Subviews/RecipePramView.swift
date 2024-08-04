//
//  RecipePramView.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import FRCommon
import SwiftUI

struct RecipePramView: View {
    private var recipe: RecipeItemViewData

    init(_ recipe: RecipeItemViewData) {
        self.recipe = recipe
    }

    var body: some View {
        VStack {
            HStack(spacing: AppStyle.layout.zero) {
                likeParamView
                Spacer()
                cookingMinutesParamView
                Spacer()
                servingsParamView
                Spacer()
                pricesParamView
            }.padding(.all, AppStyle.layout.standardSpace)
                .background(AppStyle.theme.rowCommonBackgroundColor)
                .cornerRadius(AppStyle.layout.standardCornerRadius)
                .applyShadowView()
        }.background(rectBackground)
    }
}

private extension RecipePramView {
    var likeParamView: some View {
        return RecipeParamItemView(description: language("Recipe_Detail_A_03"),
                                   value: recipe.aggregateLikes.toString)
    }

    var cookingMinutesParamView: some View {
        return RecipeParamItemView(description: language("Recipe_Detail_A_04"),
                                   value: recipe.cookingMinutes.toString)
    }

    var servingsParamView: some View {
        return RecipeParamItemView(description: language("Recipe_Detail_A_05"),
                                   value: recipe.servings.toString)
    }

    var pricesParamView: some View {
        return RecipeParamItemView(description: language("Recipe_Detail_A_06"),
                                   value: String(format: "%.1f$", recipe.pricePerServing))
    }

    var rectBackground: some View {
        return RoundedRectangle(cornerRadius: AppStyle.layout.standardCornerRadius)
            .stroke(AppStyle.theme.iconHighlightColor, lineWidth: 1)
    }
}
