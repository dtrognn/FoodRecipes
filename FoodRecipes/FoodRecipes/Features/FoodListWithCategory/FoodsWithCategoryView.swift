//
//  FoodsWithCategoryView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct FoodsWithCategoryView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var vm: FoodsWithCategoryViewModel
    private var category: CategoryItemViewData

    init(_ category: CategoryItemViewData) {
        self.category = category
        self._vm = StateObject(wrappedValue: FoodsWithCategoryViewModel(category))
    }

    private var screenConfiguration: ScreenConfiguration {
        .init(title: "Foods With Category",
              showBackButton: true,
              hidesBottomBarWhenPushed: true,
              showNaviBar: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            Text("")
        }
    }
}
