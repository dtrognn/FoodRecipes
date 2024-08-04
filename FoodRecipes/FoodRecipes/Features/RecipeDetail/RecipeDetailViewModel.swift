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
    @Published var recipe: RecipeItemViewData = .init()

    private var recipeId: Int

    init(_ recipeId: Int) {
        self.recipeId = recipeId
        super.init()
        loadData()
    }

    func loadData() {
        apiGetRecipeInfo()
    }

    private func apiGetRecipeInfo() {
        showLoading(true)
        let params = GetRecipeInfomationEndpoint.Request(includeNutrition: true)
        GetRecipeInfomationEndpoint.service(recipeId).request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                self.recipe = RecipeItemViewData(response)
            }.store(in: &cancellableSet)
    }
}

private extension RecipeItemViewData {
    convenience init(_ data: GetRecipeInfomationEndpoint.Response) {
        self.init()
        self.id = data.id
        self.title = data.title
        self.image = data.image
        self.summary = data.summary
        self.cookingMinutes = data.cookingMinutes
        self.servings = data.servings
        self.aggregateLikes = data.aggregateLikes
        self.spoonacularScore = data.spoonacularScore
        self.pricePerServing = data.pricePerServing
        self.dishTypes = data.dishTypes ?? []
        self.ingredients = data.extendedIngredients?.map { IngredientItemData($0) } ?? []
    }
}

private extension IngredientItemData {
    convenience init(_ data: ExtendedIngredient) {
        self.init()
        self.id = data.id
        self.name = data.name
        self.nameClean = data.nameClean
        self.image = data.image
        self.measures = MeasuresData(us: MeasureInfoData(data.measures?.us), metric: MeasureInfoData(data.measures?.metric))
    }
}

private extension MeasureInfoData {
    convenience init(_ data: Us?) {
        self.init()
        self.amount = data?.amount ?? 0.0
        self.unitLong = data?.unitLong ?? ""
        self.unitShort = data?.unitShort ?? ""
    }

    convenience init(_ data: Metric?) {
        self.init()
        self.amount = data?.amount ?? 0.0
        self.unitLong = data?.unitLong ?? ""
        self.unitShort = data?.unitShort ?? ""
    }
}
