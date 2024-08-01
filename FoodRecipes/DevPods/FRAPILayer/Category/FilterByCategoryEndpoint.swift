//
//  FilterByCategoryEndpoint.swift
//  FRAPILayer
//
//  Created by dtrognn on 1/8/24.
//

import Foundation
import FRCore

public struct FilterByCategoryEndpoint: Endpoint {
    public static var service = FilterByCategoryEndpoint()

    private init() {}

    public var path: String = "/api/json/v1/1/filter.php"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let category: String

        public init(_ category: String) {
            self.category = category
        }

        enum CodingKeys: String, CodingKey {
            case category = "c"
        }
    }

    public struct Response: Codable {
        public let meals: [Meal]?
    }

    public struct Meal: Codable {
        public let id: String
        public let name: String
        public let thumb: String

        enum CodingKeys: String, CodingKey {
            case id = "idMeal"
            case name = "strMeal"
            case thumb = "strMealThumb"
        }
    }
}
