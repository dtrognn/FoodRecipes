//
//  APIError.swift
//  FRCore
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public enum APIError: Error {
    case invalidResponse
    case invalidURL
    case decodingError
}
