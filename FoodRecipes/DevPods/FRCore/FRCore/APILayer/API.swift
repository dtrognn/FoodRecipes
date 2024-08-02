//
//  API.swift
//  FRCore
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation

final class API {
    static func call<Request: Endpoint, Response: Codable>(endpoint: Request, parameters: [String: Any]?) -> AnyPublisher<Response, APIError> {
        guard var components = URLComponents(string: endpoint.baseURL) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        components.path = endpoint.path

        if endpoint.method == .GET, let parameters = parameters {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }

        guard let url = components.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        printMessage("url: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        // Set headers
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        // Set HTTP body for non-GET requests
        if endpoint.method != .GET, let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200 ... 299).contains(httpResponse.statusCode)
                else {
                    throw APIError.invalidResponse
                }

                printFormattedJSON(data: data)

                return data
            }.decode(type: Response.self, decoder: JSONDecoder())
            .mapError { error -> APIError in
                switch error {
                case is URLError:
                    return .invalidResponse
                case is DecodingError:
                    return .decodingError
                default:
                    return .invalidResponse
                }
            }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    static func printFormattedJSON(data: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])

            if let jsonString = String(data: jsonData, encoding: .utf8) {
                printMessage("Response => \(jsonString)")
            }
        } catch {
            printMessage("Failed to format JSON: \(error.localizedDescription)")
        }
    }
}

func printMessage(_ message: String) {
    #if DEBUG
        print("API => \(message)")
    #endif
}
