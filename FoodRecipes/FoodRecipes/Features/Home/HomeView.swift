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
            VStack(spacing: AppStyle.layout.standardSpace) {
                headerView

                FRScrollView {
                    VStack(spacing: AppStyle.layout.standardSpace) {
                        randomRecipesView
                        complexRecipesView
                    }.padding(.all, AppStyle.layout.standardSpace)
                        .padding(.bottom, AppStyle.layout.standardButtonHeight * 2)
                }.refreshable {
                    vm.loadData()
                }
            }
        }
    }
}

// MARK: - Header

private extension HomeView {
    var headerView: some View {
        return HStack(spacing: AppStyle.layout.zero) {
            helloUserText
            Spacer()
            userImageView
        }.padding(.horizontal, AppStyle.layout.standardSpace)
    }

    var helloUserText: some View {
        return Text(String(format: language("Home_A_02"), "dtrognn"))
            .font(AppStyle.font.medium18)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .lineLimit(1)
    }

    var userImageView: some View {
        return Image(systemName: "person.crop.circle")
            .resizable()
            .frame(width: AppStyle.layout.largeSpace, height: AppStyle.layout.largeSpace)
    }
}

// MARK: - Comple recipes

private extension HomeView {
    var columns: [GridItem] {
        return [
            .init(.flexible(), spacing: AppStyle.layout.standardSpace),
            .init(.flexible(), spacing: AppStyle.layout.standardSpace),
        ]
    }

    var complexRecipesView: some View {
        return VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            listFoodsText

            LazyVGrid(columns: columns, spacing: AppStyle.layout.standardSpace) {
                ForEach(vm.recipes) { recipe in
                    ComplexRecipeItemView(recipe: recipe) { recipeSelected in
                        router.push(to: HomeTabDestination.recipeDetail(recipeSelected.id))
                    }
                }
            }
        }
    }

    var listFoodsText: some View {
        return Text(language("Home_A_04"))
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }
}

// MARK: - Random recipes

private extension HomeView {
    var randomRecipesView: some View {
        return VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            listRandomFoodsText

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: AppStyle.layout.standardSpace) {
                    ForEach(vm.randomRecipes) { recipe in
                        RandomRecipeItemView(recipe) { recipeSelected in
                            router.push(to: HomeTabDestination.recipeDetail(recipeSelected.id))
                        }
                    }
                }
            }
        }
    }

    var listRandomFoodsText: some View {
        return Text(language("Home_A_03"))
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }
}

#Preview {
    HomeView()
}
