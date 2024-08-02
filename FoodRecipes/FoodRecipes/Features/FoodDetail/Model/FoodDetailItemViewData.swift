//
//  FoodDetailItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 1/8/24.
//

import Foundation
import FRAPILayer

struct FoodDetailItemViewData: Identifiable {
    let id: String = UUID().uuidString
    private var meal: MealDetail

    init(_ meal: MealDetail) {
        self.meal = meal
    }

    func getThumb() -> String {
        return meal.mealThumb
    }

    func getIngredients() -> [String] {
        return meal.ingredients.compactMap { $0 }.filter { !$0.isEmpty }
    }

    func getMeasures() -> [String] {
        return meal.measures.compactMap { $0 }.filter { !$0.isEmpty }
    }

    func getInstructions() -> String {
        return meal.instructions
    }

    func getIngredientsWithMeasures() -> [String: String] {
        return meal.ingredientsWithMeasures
    }
}
