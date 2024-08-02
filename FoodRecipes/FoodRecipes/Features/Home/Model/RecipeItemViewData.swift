//
//  RecipeItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 3/8/24.
//

import Foundation
import FRAPILayer

struct RecipeItemViewData: Identifiable {
    let id: String = UUID().uuidString

    private var recipe: Recipe

    init(_ recipe: Recipe) {
        self.recipe = recipe
    }

    func getTitle() -> String {
        return recipe.title
    }

    func getThumb() -> String {
        return recipe.image
    }
}
