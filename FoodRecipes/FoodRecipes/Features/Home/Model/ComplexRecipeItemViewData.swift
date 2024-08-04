//
//  ComplexRecipeItemViewData.swift
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

struct ComplexRecipeItemViewData: Identifiable, Hashable {
    static func == (lhs: ComplexRecipeItemViewData, rhs: ComplexRecipeItemViewData) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {}

    let id: Int
    let title: String
    let image: String

    init(id: Int, title: String, image: String) {
        self.id = id
        self.title = title
        self.image = image
    }

//    private var recipe: GetRandomRecipesEndpoint.RandomRecipe

//    init(_ recipe: GetRandomRecipesEndpoint.RandomRecipe) {
//        self.recipe = recipe
//    }

//    func getId() -> Int {
//        return recipe.id ?? 0
//    }
//
//    func getTitle() -> String {
//        return recipe.title ?? ""
//    }
//
//    func getThumb(_ size: RecipeImageSizeType = .large) -> String {
//        // https://img.spoonacular.com/recipes/{ID}-{SIZE}.{TYPE}
//        let baseUrl = DefineConfiguration.imageBaseUrl
//        let thumbUrl = String(format: "%@/recipes/%d-%@.%@", baseUrl, recipe.id ?? 0, size.rawValue, recipe.imageType ?? "jpg")
//        return thumbUrl
//    }
}
