//
//  AuthenRouterView.swift
//  FoodRecipes
//
//  Created by dtrognn on 11/8/24.
//

import FRCommon
import SwiftUI

enum AuthenDestination: Hashable {}

class AuthenRouter: BaseRouter<AuthenRouter.Screen> {
    enum Screen: IScreen {}
}

struct AuthenRouterView: View {
    @StateObject private var router = AuthenRouter()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            LoginView()
                .navigationDestination(for: AuthenDestination.self) { _ in
                    //
                }
        }.environmentObject(router)
    }
}
