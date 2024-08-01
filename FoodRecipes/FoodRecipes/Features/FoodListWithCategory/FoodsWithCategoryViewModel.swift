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

    init(_ category: CategoryItemViewData) {
        self.category = category
        super.init()
        apiFilterByCategory()
    }

    private func apiFilterByCategory() {
        showLoading(true)
//        FilterByCategoryEndpoint.service(category).request(parameters: .init())

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

                meals.forEach {
                    print("AAA name: \($0.name)")
                }
            }.store(in: &cancellableSet)
    }
}
