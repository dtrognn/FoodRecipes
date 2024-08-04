//
//  ComplexRecipeItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 3/8/24.
//

import FRCommon
import SwiftUI

struct ComplexRecipeItemView: View {
    private var recipe: ComplexRecipeItemViewData
    private var onClick: (ComplexRecipeItemViewData) -> Void

    private var width: CGFloat = UIScreen.main.bounds.width - 2 * AppStyle.layout.standardSpace

    init(recipe: ComplexRecipeItemViewData, onClick: @escaping (ComplexRecipeItemViewData) -> Void) {
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

private extension ComplexRecipeItemView {
    var thumbView: some View {
        return ImageUrl(urlString: recipe.image) {
            ProgressView().applyTheme()
        }
    }

    var titleText: some View {
        return Text(recipe.title)
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textWhiteColor)
            .multilineTextAlignment(.center)
            .padding(.all, AppStyle.layout.standardSpace)
    }
}
