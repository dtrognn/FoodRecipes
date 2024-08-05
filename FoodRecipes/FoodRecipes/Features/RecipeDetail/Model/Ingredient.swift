//
//  Ingredient.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import Foundation

enum ImageSize: String {
    case small = "100x100"
    case medium = "250x250"
    case large = "500x500"
}

class IngredientItemData: Identifiable {
    var id: Int = 0
    var measures: MeasuresData = .init(us: .init(), metric: .init())
    var nameClean: String?
    var image: String = ""
    var name: String = ""

    init() {}

    func getImageUrl(_ size: ImageSize = .medium) -> String {
        let baseUrl = DefineConfiguration.imageBaseUrl
        let imageUrl = String(format: "%@/ingredients_%@/%@", baseUrl, size.rawValue, image)
        return imageUrl
    }

    func getDisplayName() -> String {
        return nameClean ?? name
    }
}

class MeasuresData {
    var us: MeasureInfoData
    var metric: MeasureInfoData

    init(us: MeasureInfoData, metric: MeasureInfoData) {
        self.us = us
        self.metric = metric
    }
}

// MARK: - Metric

class MeasureInfoData {
    var amount: Double = 0.0
    var unitShort: String = ""
    var unitLong: String = ""

    init() {}
}
