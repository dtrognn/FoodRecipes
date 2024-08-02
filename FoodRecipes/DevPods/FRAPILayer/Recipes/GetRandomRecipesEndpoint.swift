//
//  GetRandomRecipesEndpoint.swift
//  FRAPILayer
//
//  Created by dtrognn on 2/8/24.
//

import Foundation
import FRCore

public struct GetRandomRecipesEndpoint: Endpoint {
    public static var service = GetRandomRecipesEndpoint()

    private init() {}

    public var path: String = "/recipes/random"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let includeNutrition: Bool?
        public let includeTags: String?
        public let excludeTags: String?
        public let number: Int

        public init(includeNutrition: Bool? = nil, includeTags: String? = nil, excludeTags: String? = nil, number: Int) {
            self.includeNutrition = includeNutrition
            self.includeTags = includeTags
            self.excludeTags = excludeTags
            self.number = number
        }

        enum CodingKeys: String, CodingKey {
            case includeNutrition, number
            case includeTags = "include-tags"
            case excludeTags = "exclude-tags"
        }
    }

    public struct Response: Codable {
        public let recipes: [Recipe]?
    }
}
