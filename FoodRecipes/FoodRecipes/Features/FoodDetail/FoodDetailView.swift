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
                    mealImageView
                    VStack(spacing: AppStyle.layout.standardSpace) {
                        ingredientListView
                        instructionsView
                    }
                }.padding(.all, AppStyle.layout.standardSpace)
            }
        }
    }
}

private extension FoodDetailView {
    var mealImageView: some View {
        return ImageURLView(vm.meal?.getThumb() ?? "")
    }
}

// MARK: - Ingradients

private extension FoodDetailView {
    var ingreditentsText: some View {
        return Text(language("Food_Detail_A_01"))
            .font(AppStyle.font.semibold20)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var ingredientListView: some View {
        return VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            ingreditentsText
            LazyVStack {
                ForEach(Array(vm.meal?.getIngredientsWithMeasures() ?? [:]), id: \.key) { ingredient, measure in
                    HStack(spacing: AppStyle.layout.mediumSpace) {
                        ingredientView(ingredient)
                        Spacer()
                        measureView(measure)
                    }
                }
            }
        }
    }

    func ingredientView(_ ingredient: String) -> some View {
        return HStack(spacing: AppStyle.layout.smallSpace) {
            dotCircle
            ingredientText(ingredient)
        }
    }

    func measureView(_ measure: String) -> some View {
        return HStack(spacing: AppStyle.layout.smallSpace) {
            colonText
            measureText(measure)
            Spacer()
        }.frame(width: UIScreen.main.bounds.size.width / 3)
    }

    var dotCircle: some View {
        return Image(systemName: "circle.fill")
            .resizable()
            .applyTheme(AppStyle.theme.iconColor)
            .frame(width: 3, height: 3)
    }

    func ingredientText(_ ingredient: String) -> some View {
        return Text(ingredient)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var colonText: some View {
        return Text(":")
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    func measureText(_ measure: String) -> some View {
        return Text(measure)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }
}

// MARK: - Instructions

private extension FoodDetailView {
    var instructionsView: some View {
        return VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            instructionsText
            instructionDescriptionText
        }
    }

    var instructionsText: some View {
        return Text(language("Food_Detail_A_02"))
            .font(AppStyle.font.semibold20)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var instructionDescriptionText: some View {
        return Text(vm.meal?.getInstructions() ?? "")
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
