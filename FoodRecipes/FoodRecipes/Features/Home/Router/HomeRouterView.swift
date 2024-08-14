//
//  HomeRouterView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

class HomeRouter: BaseRouter<HomeRouter.Screen> {
    enum Screen: IScreen {
        case recipeDetail(Int)
    }

    override func getInstanceScreen(_ screen: Screen) -> AnyView {
        switch screen {
        case .recipeDetail(let id):
            return RecipeDetailView(id).environmentObject(self).asAnyView
        }
    }
}

struct HomeRouterView: View {
    @StateObject private var router = HomeRouter()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            HomeView()
                .navigationDestination(for: HomeRouter.Screen.self) { destination in
                    router.getInstanceScreen(destination)
                }
        }.environmentObject(router)
    }
}

#Preview {
    HomeRouterView()
}
