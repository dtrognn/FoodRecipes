//
//  HomeViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation
import FRAPILayer

class HomeViewModel: BaseStore {
    override init() {
        super.init()
        loadData()
    }

    func loadData() {
        apiGetListMealCategories()
    }

    private func apiGetListMealCategories() {
        let params = GetListMealCategories.Request()
        GetListMealCategories.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }

                response.categories.forEach { category in
                    print("AAA id: \(category.id) - name: \(category.name)")
                }
            }.store(in: &cancellableSet)
    }
}
