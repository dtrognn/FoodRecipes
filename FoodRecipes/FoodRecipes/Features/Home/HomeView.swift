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
                    VStack {
                        categoriesView
                    }.padding(.all, AppStyle.layout.standardSpace)
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

// MARK: - Categories

private extension HomeView {
    var categoriesView: some View {
        return VStack(alignment: .leading, spacing: AppStyle.layout.standardSpace) {
            categoriesText
            categoryListView
        }
    }

    var categoriesText: some View {
        return Text(language("Home_A_01"))
            .font(AppStyle.font.semibold24)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var columns: [GridItem] {
        return [
            .init(.flexible(), spacing: AppStyle.layout.standardSpace),
            .init(.flexible(), spacing: AppStyle.layout.standardSpace),
        ]
    }

    var categoryListView: some View {
        return LazyVGrid(columns: columns, spacing: AppStyle.layout.standardSpace) {
            ForEach(vm.categories) { category in
                CategoryItemView(category) { categorySelected in
                    router.push(to: HomeTabDestination.foodsWithCategory(categorySelected))
                }
            }
        }.padding(.bottom, AppStyle.layout.standardButtonHeight * 2)
    }
}

#Preview {
    HomeView()
}
