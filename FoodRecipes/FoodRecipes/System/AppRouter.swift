//
//  AppRouter.swift
//  FoodRecipes
//
//  Created by dtrognn on 10/8/24.
//

import Combine
import FRCommon
import SwiftUI

class AppRouter: BaseRouter<AppRouter.Screen> {
    enum Screen: IScreen {
        case appLaunch
        case login
        case mainTab
    }

    @Published var screen: Screen = .appLaunch

    override init() {
        super.init()
        screen = .appLaunch
    }

    deinit {
        print("deinit:\(#file)")
    }

    override func makeSubscription() {
        AppDataManager.shared.appState.loginState.$loggedIn.sink { [weak self] isLoggedIn in
            self?.updateScreen(isLoggedIn: isLoggedIn)
        }.store(in: &cancellableSet)
    }

    override func getInstanceScreen(_ screen: Screen) -> AnyView {
        switch screen {
        case .appLaunch:
            return SplashScreenView().asAnyView
        case .login:
            return AuthenRouterView().asAnyView
        case .mainTab:
            return MainTabView().asAnyView
        }
    }

    func updateScreen(isLoggedIn: Bool) {
        if isLoggedIn {
            screen = .mainTab
        } else {
            screen = .login
        }
        popToRootView()
    }
}

struct AppRouterView: View {
    @StateObject private var appRouter = AppRouter()

    var body: some View {
        NavigationStack(path: $appRouter.navigationPath) {
            appRouter.getInstanceScreen(appRouter.screen)
        }.environmentObject(appRouter)
    }
}
