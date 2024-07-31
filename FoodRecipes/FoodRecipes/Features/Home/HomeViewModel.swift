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
    @Published var categories: [CategoryItemViewData] = []

    override init() {
        super.init()
        loadData()
    }

    func loadData() {
        apiGetListMealCategories()
    }

    private func apiGetListMealCategories() {
        showLoading(true)
        let params = GetListMealCategories.Request()
        GetListMealCategories.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                guard let categories = response.categories else { return }
                self.categories = categories.map { CategoryItemViewData($0) }
            }.store(in: &cancellableSet)
    }
}

private extension CategoryItemViewData {
    init(_ data: GetListMealCategories.Category) {
        self.name = data.name
        self.thumb = data.thumb
        self.description = data.description
    }
}
