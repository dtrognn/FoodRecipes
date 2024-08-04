//
//  HomeViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation
import FRAPILayer

class HomeViewModel: BaseViewModel {
    @Published var recipes: [ComplexRecipeItemViewData] = []

    override init() {
        super.init()
        loadData()
    }

    func loadData() {
        apiGetRandomRecipes()
    }

    private func apiGetRandomRecipes() {
        showLoading(true)
        let params = SearchRecipesComplexEndpoint.Request(number: 20)
        SearchRecipesComplexEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                guard let recipes = response.results else { return }
                self.recipes = recipes.map { ComplexRecipeItemViewData($0) }
            }.store(in: &cancellableSet)
    }
}

private extension ComplexRecipeItemViewData {
    init(_ data: SearchRecipesComplexEndpoint.ComplexRecipe) {
        self.id = data.id
        self.title = data.title
        self.image = data.image
    }
}
