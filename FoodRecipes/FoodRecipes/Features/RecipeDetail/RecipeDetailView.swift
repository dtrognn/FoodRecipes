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
    private var recipe: RecipeItemViewData

    init(_ recipe: RecipeItemViewData) {
        self.recipe = recipe
        self._vm = StateObject(wrappedValue: RecipeDetailViewModel(recipe))
    }

    private var screenConfiguration: ScreenConfiguration {
        return .init(
            title: recipe.getTitle(),
            showBackButton: true,
            showNaviBar: true
        )
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            FRScrollView {
                VStack(spacing: AppStyle.layout.standardSpace) {
                    recipeImage
                    instructionsView
                }.padding(.all, AppStyle.layout.standardSpace)
            }
        }.onAppear {
            vm.loadData()
        }
    }
}

private extension RecipeDetailView {
    var recipeImage: some View {
        return ImageUrl(urlString: recipe.getThumb(.xxlarge)) {
            ProgressView().applyTheme()
        }.cornerRadius(AppStyle.layout.standardSpace)
            .applyShadowView()
    }

    var instructionsView: some View {
        return ZStack(alignment: .bottomTrailing) {
            instructionsText
//            showMoreButton
        }
    }

    var instructionsText: some View {
        return Text(vm.summary)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .lineLimit(5)
            .lineSpacing(AppStyle.layout.lineSpacing)
            .multilineTextAlignment(.leading)
    }

    var showMoreButton: some View {
        return Button {
            // TODO: -
        } label: {
            Text("show more")
                .font(AppStyle.font.regular16)
                .foregroundStyle(AppStyle.theme.textUnderlineColor)
                .padding(.all, 1)
                .background(AppStyle.theme.backgroundColor)
        }
    }
}

//extension String {
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
//}
