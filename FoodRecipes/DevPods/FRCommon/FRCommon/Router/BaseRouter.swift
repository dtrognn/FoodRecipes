//
//  BaseRouter.swift
//  FRCommon
//
//  Created by dtrognn on 12/8/24.
//

import Combine
import SwiftUI

public protocol IScreen: Hashable {}

open class BaseRouter<Screen: IScreen>: ObservableObject {
    @Published public var navigationPath: NavigationPath
    public var cancellableSet: Set<AnyCancellable> = []

    public init() {
        self.navigationPath = NavigationPath()
    }

    public init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }

    open func makeSubscription() {

    }

    open func getInstanceScreen(_ screen: Screen) -> AnyView {
        fatalError("Need to implement func getInstanceScreen()")
    }

    public func push(to screen: Screen) {
        navigationPath.append(screen)
    }

    public func popView() {
        navigationPath.removeLast()
    }

    public func popToRootView() {
        navigationPath.removeLast(navigationPath.count)
    }
}
