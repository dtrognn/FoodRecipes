//
//  FoodsWithCategoryViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 1/8/24.
//

import Foundation
import FRAPILayer

class FoodsWithCategoryViewModel: BaseViewModel {
    private var category: CategoryItemViewData

    @Published var foods: [FoodItemViewData] = []

    init(_ category: CategoryItemViewData) {
        self.category = category
        super.init()
        apiFilterByCategory()
    }

    private func apiFilterByCategory() {
        showLoading(true)
        let params = FilterByCategoryEndpoint.Request(category.name)
        FilterByCategoryEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                guard let meals = response.meals else { return }
                self.foods = meals.map { FoodItemViewData($0) }
            }.store(in: &cancellableSet)
    }
}

private extension FoodItemViewData {
    convenience init(_ data: FilterByCategoryEndpoint.Meal) {
        self.init()
        self.id = data.id
        self.name = data.name
        self.thumb = data.thumb
    }
}
