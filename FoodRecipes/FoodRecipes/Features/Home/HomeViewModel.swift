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
    @Published var recipes: [RecipeItemViewData] = []

    override init() {
        super.init()
        loadData()
    }

    func loadData() {
        apiGetRandomRecipes()
    }

    private func apiGetRandomRecipes() {
        print("AAA time start: \(Date())")
        let params = GetRandomRecipesEndpoint.Request(includeNutrition: false, number: 10)
        GetRandomRecipesEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }

                guard let recipes = response.recipes else { return }

                self.recipes = recipes.map { RecipeItemViewData($0) }
                print("AAA time end: \(Date())")
            }.store(in: &cancellableSet)
    }
}
