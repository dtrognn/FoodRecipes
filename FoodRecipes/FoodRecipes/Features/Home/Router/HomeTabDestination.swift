//
//  HomeTabDestination.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

enum HomeTabDestination: Hashable {
    case foodsWithCategory(CategoryItemViewData)
    case foodDetail(FoodItemViewData)
}
