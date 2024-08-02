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
            }.frame(width: width, height: width / (16 / 9))
                .cornerRadius(AppStyle.layout.standardCornerRadius)
                .applyShadowView()
        }
    }
}

private extension RandomRecipeItemView {
    var thumbView: some View {
        return ImageURLView(recipe.getThumb())
            .scaledToFit()
    }

    var titleText: some View {
        return Text(recipe.getTitle())
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .multilineTextAlignment(.center)
//            .lineLimit(2)
            .padding(.all, AppStyle.layout.standardSpace)
    }
}
