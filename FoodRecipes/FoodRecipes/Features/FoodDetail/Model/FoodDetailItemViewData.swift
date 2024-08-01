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
}
