//
//  SearchRecipesComplexEndpoint.swift
//  FRAPILayer
//
//  Created by dtrognn on 4/8/24.
//

import Foundation
import FRCore

public struct SearchRecipesComplexEndpoint: Endpoint {
    public static var service = SearchRecipesComplexEndpoint()
    public var path: String = "/recipes/complexSearch"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let number: Int

        public init(number: Int) {
            self.number = number
        }
    }

    public struct Response: Codable {
        public let offset: Int?
        public let number: Int?
        public let totalResults: Int?
        public let results: [ComplexRecipe]?
    }

    public struct ComplexRecipe: Codable {
        public let id: Int
        public let title: String
        public let image: String
        public let imageType: String?
    }
}
