//
//  FoodWithCategoryItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 1/8/24.
//

import FRCommon
import SwiftUI

struct FoodWithCategoryItemView: View {
    @ObservedObject private var food: FoodItemViewData
    private var onCLick: (FoodItemViewData) -> Void

    init(food: FoodItemViewData, onCLick: @escaping (FoodItemViewData) -> Void) {
        self.food = food
        self.onCLick = onCLick
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onCLick(food)
        } label: {
            VStack {
                VStack(spacing: AppStyle.layout.zero) {
                    foodThumbView
                    foodNameText
                }
            }.background(AppStyle.theme.rowCommonBackgroundColor)
                .cornerRadius(AppStyle.layout.standardSpace)
                .applyShadowView()
        }
    }
}

private extension FoodWithCategoryItemView {
    func getWidthOfImage() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.size.width
        let spacing = AppStyle.layout.standardSpace
        return deviceWidth / 2 - spacing
    }

    var foodThumbView: some View {
        return ImageURLView(food.thumb)
            .frame(width: getWidthOfImage(), height: getWidthOfImage())
    }

    var foodNameText: some View {
        return Text(food.name)
            .font(AppStyle.font.medium16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .padding(.vertical, AppStyle.layout.smallSpace)
            .padding(.horizontal, AppStyle.layout.standardSpace)
            .frame(maxHeight: 50)
    }
}
