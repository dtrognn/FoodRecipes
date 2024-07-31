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

#Preview {
    FoodsWithCategoryView()
}
