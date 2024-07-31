//
//  APIError.swift
//  FRCore
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public enum APIError: LocalizedError {
    case invalidResponse
    case invalidURL
    case decodingError

    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .invalidURL:
            return "Invalid URL."
        case .decodingError:
            return "Failed to decode the response."
        }
    }
}
