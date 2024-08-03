//
//  RecipeItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 3/8/24.
//

import Foundation
import FRAPILayer

enum RecipeImageSizeType: String {
    case small = "90x90"
    case mediumThumbnail = "240x150"
    case largeThumbnail = "312x150"
    case medium = "312x231"
    case large = "480x360"
    case xlarge = "556x370"
    case xxlarge = "636x393"
}

struct RecipeItemViewData: Identifiable {
    let id: String = UUID().uuidString

    private var recipe: Recipe

    init(_ recipe: Recipe) {
        self.recipe = recipe
    }

    func getTitle() -> String {
        return recipe.title
    }

    func getThumb(_ size: RecipeImageSizeType = .large) -> String {
        // https://img.spoonacular.com/recipes/{ID}-{SIZE}.{TYPE}
        let baseUrl = DefineConfiguration.imageBaseUrl
        let thumbUrl = String(format: "%@/recipes/%d-%@.%@", baseUrl, recipe.id, size.rawValue, recipe.imageType ?? "jpg")
        return thumbUrl
    }
}
