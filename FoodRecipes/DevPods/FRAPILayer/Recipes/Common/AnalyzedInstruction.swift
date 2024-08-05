//
//  AnalyzedInstruction.swift
//  FRAPILayer
//
//  Created by dtrognn on 2/8/24.
//

import Foundation

public struct AnalyzedInstruction: Codable {
    // Define properties as needed
    public let name: String
    public let steps: [Step]?

    enum CodingKeys: String, CodingKey {
        case name
        case steps
    }
}

public struct Step: Codable {
    public let number: Int
    public let step: String
    public let ingredients: [Ent]?
    public let equipment: [Ent]?
    public let length: Length?

    enum CodingKeys: String, CodingKey {
        case number
        case step
        case ingredients
        case equipment
        case length
    }
}

public struct Ent: Codable {
    public let id: Int
    public let name: String
    public let image: String
    public let localizedName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case localizedName
    }
}

// MARK: - Length

public struct Length: Codable {
    public let number: Int
    public let unit: String

    enum CodingKeys: String, CodingKey {
        case number
        case unit
    }
}
