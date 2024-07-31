//
//  Extension.swift
//  FRCore
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .useDefaultKeys
        let data = try encoder.encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
