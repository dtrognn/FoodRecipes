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

    var path: String { get }
    var method: HTTPMethod { get }
    var onlyUseHeadersDefault: Bool { get }
    var headers: [String: String]? { get }
}

public extension Endpoint {
    var onlyUseHeadersDefault: Bool {
        return false
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
