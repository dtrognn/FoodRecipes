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
    @Published var randomRecipes: [RandomRecipeItemViewData] = []

    override init() {
        super.init()
        mapApiReciplesComplexAndRandom()
    }

    func loadData() {
        apiSearchRecipesComplex()
    }

    private func apiSearchRecipesComplex() {
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

    private func mapApiReciplesComplexAndRandom() {
        showLoading(true)

        let recipesComplexParams = SearchRecipesComplexEndpoint.Request(number: 50)
        let recipesComplexRequest = SearchRecipesComplexEndpoint.service.request(parameters: recipesComplexParams)

        let randomRecipesParams = GetRandomRecipesEndpoint.Request(number: 10)
        let randomRecipesRequest = GetRandomRecipesEndpoint.service.request(parameters: randomRecipesParams)

        Publishers.Zip(recipesComplexRequest, randomRecipesRequest)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] complexResponse, randomResponse in
                guard let self = self else { return }
                self.showLoading(false)

                guard let complexRecipes = complexResponse.results else { return }
                self.recipes = complexRecipes.map { ComplexRecipeItemViewData($0) }

                guard let randomRecipes = randomResponse.recipes else { return }
                self.randomRecipes = randomRecipes.map { RandomRecipeItemViewData($0) }
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

private extension RandomRecipeItemViewData {
    init(_ data: GetRandomRecipesEndpoint.RandomRecipe) {
        self.id = data.id ?? 0
        self.name = data.title ?? ""
        self.image = data.image ?? ""
        self.imageType = data.imageType ?? "jpg"
    }
}
