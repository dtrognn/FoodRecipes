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
        .init(title: language("Food_List_A_01") + category.name,
              showBackButton: true,
              hidesBottomBarWhenPushed: true,
              showNaviBar: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            FRScrollView {
                VStack(spacing: AppStyle.layout.standardSpace) {
                    categoryInfoView
                    foodListView
                }.padding(.all, AppStyle.layout.standardSpace)
            }
        }
    }
}

private extension FoodsWithCategoryView {
    var categoryInfoView: some View {
        return HStack(spacing: AppStyle.layout.standardSpace) {
            categoryThumbView
            categoryDescriptionText
        }.padding(.all, AppStyle.layout.standardSpace)
            .background(Color.random.opacity(0.4))
            .background(
                ImageURLView(category.thumb)
                    .scaledToFill()
            )
            .cornerRadius(AppStyle.layout.standardCornerRadius)
            .applyShadowView()
    }

    var categoryThumbView: some View {
        return ImageURLView(category.thumb)
            .frame(width: 75, height: 75)
    }

    var categoryDescriptionText: some View {
        return Text(category.description)
            .font(AppStyle.font.medium16)
            .foregroundStyle(AppStyle.theme.textWhiteColor)
            .lineLimit(5)
            .lineSpacing(AppStyle.layout.lineSpacing)
            .multilineTextAlignment(.leading)
    }
}

private extension FoodsWithCategoryView {
    var foodListView: some View {
        return VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            foodListText
            foodList
        }
    }

    var foodListText: some View {
        return Text(language("Food_List_A_01"))
            .font(AppStyle.font.semibold24)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var columns: [GridItem] {
        return [
            .init(.flexible(), spacing: AppStyle.layout.standardSpace),
            .init(.flexible(), spacing: AppStyle.layout.standardSpace),
        ]
    }

    var foodList: some View {
        return if vm.foods.isEmpty {
            noFoodtext.asAnyView
        } else {
            LazyVGrid(columns: columns, spacing: AppStyle.layout.standardSpace) {
                ForEach(vm.foods) { food in
                    FoodWithCategoryItemView(food: food) { meal in
                        router.push(to: HomeTabDestination.foodDetail(meal))
                    }
                }
            }.asAnyView
        }
    }

    var noFoodtext: some View {
        return GeometryReader { proxy in
            Text(String(format: language("Food_List_A_02"), category.name))
                .font(AppStyle.font.regular16)
                .foregroundStyle(AppStyle.theme.textNormalColor)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}
