//
//  RandomRecipeItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 5/8/24.
//

import Foundation

struct RandomRecipeItemViewData: Identifiable {
    let id: Int
    let name: String
    let image: String
    let imageType: String

    init(id: Int, name: String, image: String, imageType: String) {
        self.id = id
        self.name = name
        self.image = image
        self.imageType = imageType
    }

    func getThumb(_ size: RecipeImageSizeType = .large) -> String {
        // https://img.spoonacular.com/recipes/{ID}-{SIZE}.{TYPE}
        let baseUrl = DefineConfiguration.imageBaseUrl
        let thumbUrl = String(format: "%@/recipes/%d-%@.%@", baseUrl, id, size.rawValue, imageType)
        return thumbUrl
    }
}
