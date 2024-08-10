//
//  BaseRouter.swift
//  FRCommon
//
//  Created by dtrognn on 10/8/24.
//

import Combine
import SwiftUI

public protocol IScreen: Hashable {}

open class BaseRouter<Screen: IScreen>: ObservableObject {
    public var cancellableSet: Set<AnyCancellable> = []
    @Published public var navigationPath: NavigationPath

    public init() {
        self.navigationPath = NavigationPath()
        makeSubcription()
    }

    public init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }

    open func makeSubcription() {

    }

    open func getInstanceScreen(_ screen: Screen) -> AnyView {
        fatalError("Need to implement func getInstanceScreen")
    }

    public func push(to screen: Screen) {
        navigationPath.append(screen)
    }

    public func popView() {
        navigationPath.removeLast()
    }

    public func popToRootView() {
        navigationPath = NavigationPath()
    }
}
