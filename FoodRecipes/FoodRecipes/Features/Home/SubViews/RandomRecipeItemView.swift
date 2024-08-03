//
//  RandomRecipeItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 3/8/24.
//

import FRCommon
import SwiftUI

struct RandomRecipeItemView: View {
    private var recipe: RecipeItemViewData
    private var onClick: (RecipeItemViewData) -> Void

    private var width: CGFloat = UIScreen.main.bounds.width - 2 * AppStyle.layout.standardSpace

    init(recipe: RecipeItemViewData, onClick: @escaping (RecipeItemViewData) -> Void) {
        self.recipe = recipe
        self.onClick = onClick
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onClick(recipe)
        } label: {
            ZStack {
                thumbView
                    .overlay(AppStyle.theme.iconOffColor.opacity(0.7))
                titleText
            }.cornerRadius(AppStyle.layout.standardCornerRadius)
                .applyShadowView()
        }
    }
}

private extension RandomRecipeItemView {
    var thumbView: some View {
        return ImageUrl(urlString: recipe.getThumb()) {
            ProgressView().applyTheme()
        }
    }

    var titleText: some View {
        return Text(recipe.getTitle())
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textWhiteColor)
            .multilineTextAlignment(.center)
            .padding(.all, AppStyle.layout.standardSpace)
    }
}
