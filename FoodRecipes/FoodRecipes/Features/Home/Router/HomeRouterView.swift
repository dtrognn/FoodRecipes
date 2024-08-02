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
