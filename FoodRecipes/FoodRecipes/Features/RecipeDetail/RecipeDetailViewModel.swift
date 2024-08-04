//
//  RecipeDetailViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 4/8/24.
//

import Foundation
import FRAPILayer
import SwiftUI
import UIKit

class RecipeDetailViewModel: BaseViewModel {
    @Published var recipe: RecipeItemViewData
    @Published var summary: String = ""

    init(_ recipe: RecipeItemViewData) {
        self.recipe = recipe
        super.init()
    }

    func loadData() {
        apiGetRecipeInfo()
    }

    private func apiGetRecipeInfo() {
        showLoading(true)
        let params = GetRecipeInfomationEndpoint.Request(includeNutrition: true)
        GetRecipeInfomationEndpoint.service(recipe.getId()).request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                self.summary = response.summary

            }.store(in: &cancellableSet)
    }
}

struct AttributedText: UIViewRepresentable {
    let attributedString: NSAttributedString

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = attributedString
    }
}
