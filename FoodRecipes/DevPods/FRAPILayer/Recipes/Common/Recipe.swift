//
//  Recipe.swift
//  FRAPILayer
//
//  Created by dtrognn on 2/8/24.
//

import Foundation

public struct Recipe: Codable {
    public let id: Int?
    public let title: String
    public let image: String
    public let imageType: String?
    public let servings: Int?
    public let readyInMinutes: Int?
    public let cookingMinutes: Int?
    public let preparationMinutes: Int?
    public let license: String?
    public let sourceName: String?
    public let sourceUrl: String?
    public let spoonacularSourceUrl: String?
    public let healthScore: Double?
    public let spoonacularScore: Double?
    public let pricePerServing: Double?
    public let analyzedInstructions: [AnalyzedInstruction]?
    public let cheap: Bool?
    public let creditsText: String?
    public let cuisines: [String]?
    public let dairyFree: Bool?
    public let diets: [String]?
    public let gaps: String?
    public let glutenFree: Bool?
    public let instructions: String?
    public let ketogenic: Bool?
    public let lowFodmap: Bool?
    public let occasions: [String]?
    public let sustainable: Bool?
    public let vegan: Bool?
    public let vegetarian: Bool?
    public let veryHealthy: Bool?
    public let veryPopular: Bool?
    public let whole30: Bool?
    public let weightWatcherSmartPoints: Int?
    public let dishTypes: [String]?
    public let extendedIngredients: [ExtendedIngredient]?
    public let summary: String?
    public let winePairing: WinePairing?
}
