//
//  Endpoint.swift
//  FRCore
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation

public protocol Endpoint {
    associatedtype Request: Codable
    associatedtype Response: Codable

    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

public extension Endpoint {
    var baseURL: String {
        return "https://www.themealdb.com"
    }

    func request(parameters: Request) -> AnyPublisher<Response, APIError> {
        var params = [String: Any]()
        do { params = try parameters.asDictionary() } catch {}
        return API.call(endpoint: self, parameters: params)
    }
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
}
