//
//  RandomRecipeItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 5/8/24.
//

import FRCommon
import SwiftUI

struct RandomRecipeItemView: View {
    private var recipe: RandomRecipeItemViewData
    private var onCLick: (RandomRecipeItemViewData) -> Void

    init(_ recipe: RandomRecipeItemViewData, onCLick: @escaping (RandomRecipeItemViewData) -> Void) {
        self.recipe = recipe
        self.onCLick = onCLick
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onCLick(recipe)
        } label: {
            VStack(spacing: AppStyle.layout.zero) {
                recipeImage
                    .overlay(AppStyle.theme.iconOffColor.opacity(0.7))
                    .overlay(recipeNameText)
            }.cornerRadius(AppStyle.layout.standardCornerRadius)
        }
    }
}

private extension RandomRecipeItemView {
    var width: CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        return (deviceWidth / 2) - 2 * AppStyle.layout.standardSpace
    }

    var recipeImage: some View {
        return ImageUrl(urlString: recipe.getThumb(.xxlarge)) {
            ProgressView().applyTheme()
        }.frame(width: width, height: width / (16 / 9))
    }

    var recipeNameText: some View {
        return Text(recipe.name)
            .font(AppStyle.font.medium16)
            .foregroundStyle(AppStyle.theme.textWhiteColor)
            .multilineTextAlignment(.center)
            .padding(.horizontal, AppStyle.layout.mediumSpace)
    }
}
