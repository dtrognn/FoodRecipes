//
//  ExtendedIngredient.swift
//  FRAPILayer
//
//  Created by dtrognn on 2/8/24.
//

import Foundation

public struct ExtendedIngredient: Codable {
    public let aisle: String?
    public let amount: Double?
    public let consistency: String?
    public let id: Int?
    public let image: String?
    public let measures: Measures?
    public let meta: [String]?
    public let name: String?
    public let original: String?
    public let originalName: String?
    public let unit: String?
}

public struct Measures: Codable {
    public let metric: Metric?
    public let us: Us?
}

public struct Metric: Codable {
    public let amount: Double?
    public let unitLong: String?
    public let unitShort: String?
}

public struct Us: Codable {
    public let amount: Double?
    public let unitLong: String?
    public let unitShort: String?
}
