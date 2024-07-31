//
//  HomeView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var vm = HomeViewModel()

    private var screenConfiguration: ScreenConfiguration {
        .init(title: "", showBackButton: false, hidesBottomBarWhenPushed: false, showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()
                Button {
                    router.push(to: HomeTabDestination.foodsWithCategory)
                } label: {
                    Text("Home View")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
