//
//  Router.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public final class Router: ObservableObject {
    @Published public var path = NavigationPath()

    public init() {}

    public func push(to destination: any Hashable) {
        path.append(destination)
    }

    public func popView() {
        path.removeLast()
    }

    public func popToRootView() {
        path = NavigationPath()
    }
}
