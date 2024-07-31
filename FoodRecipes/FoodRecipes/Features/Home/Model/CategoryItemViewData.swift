//
//  CategoryItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

struct CategoryItemViewData: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let thumb: String
    let description: String
}
