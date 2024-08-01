//
//  SearchMealDetailByIdEndpoint.swift
//  FRAPILayer
//
//  Created by dtrognn on 1/8/24.
//

import Foundation
import FRCore

public struct SearchMealDetailByIdEndpoint: Endpoint {
    public static var service = SearchMealDetailByIdEndpoint()

    private init() {}

    public var path: String = "/api/json/v1/1/lookup.php"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let id: String

        public init(_ id: String) {
            self.id = id
        }

        enum CodingKeys: String, CodingKey {
            case id = "i"
        }
    }

    public struct Response: Codable {
        public let meals: [MealDetail]?
    }
}
