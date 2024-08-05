//
//  DishesTypeView.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import FRCommon
import SwiftUI

struct DishesTypeView: View {
    private var recipe: RecipeItemViewData

    init(_ recipe: RecipeItemViewData) {
        self.recipe = recipe
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: AppStyle.layout.mediumSpace) {
                ForEach(recipe.dishTypes, id: \.self) { type in
                    dishTypeView(type)
                }
            }
        }
    }
}

private extension DishesTypeView {
    func dishTypeView(_ type: String) -> some View {
        return Text(type)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textHightlightColor)
            .padding(.vertical, AppStyle.layout.smallSpace)
            .padding(.horizontal, AppStyle.layout.mediumSpace)
            .background(roundedView)
    }

    var roundedView: some View {
        return RoundedRectangle(cornerRadius: AppStyle.layout.largeCornerRadius)
            .stroke(AppStyle.theme.iconHighlightColor, lineWidth: 1)
    }
}
