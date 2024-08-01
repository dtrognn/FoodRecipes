//
//  HomeRouterView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct HomeRouterView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .navigationDestination(for: HomeTabDestination.self) { destination in
                    switch destination {
                    case .foodsWithCategory(let category):
                        FoodsWithCategoryView(category)
                    case .foodDetail(let food):
                        FoodDetailView(food: food)
                    default:
                        EmptyView()
                    }
                }
        }.environmentObject(router)
    }
}

#Preview {
    HomeRouterView()
}
