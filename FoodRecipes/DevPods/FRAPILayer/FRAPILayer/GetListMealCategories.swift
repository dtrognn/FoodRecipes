//
//  GetListMealCategories.swift
//  FRAPILayer
//
//  Created by dtrognn on 31/7/24.
//

import Foundation
import FRCore

public struct GetListMealCategories: Endpoint {
    public static let service = GetListMealCategories()

    private init() {}

    public var path: String = "/api/json/v1/1/categories.php"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public init() {}
    }

    public struct Response: Codable {
        public let categories: [Category]?
    }

    public struct Category: Codable {
        public let id: String
        public let name: String
        public let thumb: String
        public let description: String

        enum CodingKeys: String, CodingKey {
            case id = "idCategory"
            case name = "strCategory"
            case thumb = "strCategoryThumb"
            case description = "strCategoryDescription"
        }
    }
}
