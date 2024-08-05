//
//  RecipeDetailView.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import FRCommon
import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var vm: RecipeDetailViewModel

    init(_ recipeId: Int) {
        self._vm = StateObject(wrappedValue: RecipeDetailViewModel(recipeId))
    }

    private var screenConfiguration: ScreenConfiguration {
        return .init(
            title: language("Recipe_Detail_A_09"),
            showBackButton: true,
            showNaviBar: true
        )
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            FRScrollView {
                VStack(spacing: AppStyle.layout.standardSpace) {
                    recipeImage
                    recipeNameText
                    summaryView
                    RecipePramView(vm.recipe)
                    DishesTypeView(vm.recipe)
                    IngredientsView(vm.recipe.ingredients)
                }.padding(.all, AppStyle.layout.standardSpace)
                    .padding(.bottom, AppStyle.layout.largeSpace)
            }
        }
    }
}

private extension RecipeDetailView {
    var recipeNameText: some View {
        return Text(vm.recipe.title)
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .multilineTextAlignment(.center)
    }

    var recipeImage: some View {
        return ImageUrl(urlString: vm.recipe.image) {
            ProgressView().applyTheme()
        }.cornerRadius(AppStyle.layout.standardSpace)
            .applyShadowView()
    }

    var summaryView: some View {
        return VStack(spacing: AppStyle.layout.standardSpace) {
//            HStack(spacing: AppStyle.layout.zero) {
//                summaryText
//                Spacer()
//                summarySeeDetailButton
//            }
            summaryDescriptionText
        }
    }

    var summaryText: some View {
        return Text(language("Recipe_Detail_A_01"))
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }

    var summarySeeDetailButton: some View {
        return Button {
            // TODO: -
        } label: {
            Text(language("Recipe_Detail_A_02"))
                .font(AppStyle.font.medium16)
                .foregroundStyle(AppStyle.theme.textHightlightColor)
        }
    }

    var summaryDescriptionText: some View {
        return Text(vm.recipe.summary)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .frame(maxWidth: .infinity)
            .lineLimit(5)
            .lineSpacing(AppStyle.layout.lineSpacing)
            .multilineTextAlignment(.leading)
    }
}

// extension String {
//    var htmlToAttributedString: AttributedString {
//        guard let data = data(using: .utf8) else {
//            return AttributedString("")
//        }
//        do {
//            let attributedString = try NSAttributedString(
//                data: data,
//                options: [.documentType: NSAttributedString.DocumentType.html],
//                documentAttributes: nil
//            )
//            return AttributedString(attributedString)
//        } catch {
//            return AttributedString("")
//        }
//    }
//
//    func attributedString(from html: String) -> AttributedString {
//        guard let data = html.data(using: .utf8) else {
//            return AttributedString("")
//        }
//        do {
//            let attributedString = try NSAttributedString(
//                data: data,
//                options: [.documentType: NSAttributedString.DocumentType.html],
//                documentAttributes: nil
//            )
//            return AttributedString(attributedString)
//        } catch {
//            return AttributedString("")
//        }
//    }
// }
