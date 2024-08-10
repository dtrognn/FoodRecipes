//
//  GetRecipeInfomationEndpoint.swift
//  FRAPILayer
//
//  Created by dtrognn on 4/8/24.
//

import Foundation
import FRCore

public struct GetRecipeInfomationEndpoint: Endpoint {
    public static func service(_ id: Int) -> GetRecipeInfomationEndpoint {
        var service = GetRecipeInfomationEndpoint()
        service.path = String(format: service.path, id)
        return service
    }

    public var path: String = "/recipes/%d/information"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let includeNutrition: Bool
        public let addWinePairing: Bool?
        public let addTasteData: Bool?

        public init(includeNutrition: Bool, addWinePairing: Bool? = nil, addTasteData: Bool? = nil) {
            self.includeNutrition = includeNutrition
            self.addWinePairing = addWinePairing
            self.addTasteData = addTasteData
        }
    }

    public struct Response: Codable {
        public let id: Int
        public let title: String
        public let image: String
        public let imageType: String?
        public let instructions: String
        public let summary: String
        public let dishTypes: [String]?
        public let cookingMinutes: Int?
        public let servings: Int
        public let aggregateLikes: Int
        public let spoonacularScore: Double
        public let pricePerServing: Double
        public let extendedIngredients: [ExtendedIngredient]?
        public let analyzedInstructions: [AnalyzedInstruction]?
    }
}
