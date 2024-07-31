//
//  FRCommonBundle.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public enum FRCommonBundle {
    public static let useResourceBundles = false
    public static let bundleName = "FRCommon.bundle"
}

private class GetBundle {}

public extension Bundle {
    class func frCommonResourceBundle() -> Bundle {
        let framework = Bundle(for: GetBundle.self)
        guard FRCommonBundle.useResourceBundles else {
            return framework
        }
        guard let resourceBundleURL = framework.url(forResource: FRCommonBundle.bundleName,
                                                    withExtension: nil)
        else {
            fatalError("\(FRCommonBundle.bundleName) not found!")
        }
        guard let resourceBundle = Bundle(url: resourceBundleURL) else {
            fatalError("Cannot access \(FRCommonBundle.bundleName)")
        }
        return resourceBundle
    }
}

extension Image {
    static func image(_ name: String) -> Image {
        return Image(name, bundle: Bundle.frCommonResourceBundle())
    }
}
