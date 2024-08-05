//
//  WinePairing.swift
//  FRAPILayer
//
//  Created by dtrognn on 3/8/24.
//

import Foundation

public struct WinePairing: Codable {
    public let pairedWines: [String]?
    public let pairingText: String?
    public let productMatches: [ProductMatch]?
}

public struct ProductMatch: Codable {
    public let id: Int?
    public let title: String?
    public let description: String?
    public let price: String?
    public let imageUrl: String?
    public let averageRating: Double?
    public let ratingCount: Int?
    public let score: Double?
    public let link: String?
}
