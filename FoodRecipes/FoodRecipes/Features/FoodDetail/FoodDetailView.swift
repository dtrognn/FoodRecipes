//
//  FoodDetailView.swift
//  FoodRecipes
//
//  Created by dtrognn on 1/8/24.
//

import FRCommon
import SwiftUI

struct FoodDetailView: View {
    @StateObject private var vm: FoodDetailViewModel
    private var food: FoodItemViewData

    init(food: FoodItemViewData) {
        self.food = food
        self._vm = StateObject(wrappedValue: FoodDetailViewModel(food))
    }

    private var screenConfiguration: ScreenConfiguration {
        .init(title: food.name,
              showBackButton: true,
              hidesBottomBarWhenPushed: true,
              showNaviBar: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            FRScrollView {
                VStack {

                }.padding(.all, AppStyle.layout.standardSpace)
            }
        }
    }
}
