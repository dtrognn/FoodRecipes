//
//  RecipeItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import Foundation

class RecipeItemViewData: Identifiable {
    var id: Int = 0
    var title: String = ""
    var image: String = ""
    var summary: String = ""
    var cookingMinutes: Int?
    var servings: Int = 0
    var aggregateLikes: Int = 0
    var spoonacularScore: Double = 0.0
    var pricePerServing: Double = 0.0
    var dishTypes: [String] = []
    var ingredients: [IngredientItemData] = []

    init() {}

    init(id: Int,
         title: String,
         image: String,
         summary: String)
    {
        self.id = id
        self.title = title
        self.image = image
        self.summary = summary
    }
}
