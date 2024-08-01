//
//  FoodDetailViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 1/8/24.
//

import Foundation
import FRAPILayer

class FoodDetailViewModel: BaseViewModel {
    private var food: FoodItemViewData

    @Published var meal: FoodDetailItemViewData?

    init(_ food: FoodItemViewData) {
        self.food = food
    }

    private func apiSearchMealById() {
        showLoading(true)

        let params = SearchMealDetailByIdEndpoint.Request(food.id)
        SearchMealDetailByIdEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                guard let meals = response.meals, let meal = meals.first else {
                    self.showErrorMessage("")
                    return
                }
                self.meal = FoodDetailItemViewData(meal)
            }.store(in: &cancellableSet)
    }
}
