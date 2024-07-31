//
//  HomeViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation
import FRCore

open class BaseStore: ObservableObject {
    public var cancellableSet: Set<AnyCancellable> = []
}

class HomeViewModel: BaseStore {
    override init() {
        super.init()
        api()
    }

    private func api() {
        let params = GetListMealCategories.Request()
        GetListMealCategories.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }

                switch error {
                    case .finished:
                        break
                    case .failure(let error):
                        print("AAA error \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }

                response.categories.forEach { category in
                    print("AAA id: \(category.id) - name: \(category.name)")
                }
            }.store(in: &cancellableSet)
    }
}

struct GetListMealCategories: Endpoint {
    static let service = GetListMealCategories()

    var path: String = "/api/json/v1/1/categories.php"
    var method: FRCore.HTTPMethod = .GET
    var headers: [String: String]? = nil

    public struct Request: Codable {}

    public struct Response: Codable {
        let categories: [Category]
    }

    public struct Category: Codable {
        let id: String
        let name: String
        let thumb: String
        let description: String

        enum CodingKeys: String, CodingKey {
            case id = "idCategory"
            case name = "strCategory"
            case thumb = "strCategoryThumb"
            case description = "strCategoryDescription"
        }
    }
}
