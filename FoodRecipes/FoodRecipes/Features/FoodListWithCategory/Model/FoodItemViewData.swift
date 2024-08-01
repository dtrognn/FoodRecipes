//
//  FoodItemViewData.swift
//  FoodRecipes
//
//  Created by dtrognn on 1/8/24.
//

import Foundation

class FoodItemViewData: Identifiable, ObservableObject, Hashable {
    static func == (lhs: FoodItemViewData, rhs: FoodItemViewData) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id: String = UUID().uuidString
    var name: String = ""
    var thumb: String = ""

    @Published var isFavourite: Bool = false

    init() {}

    init(id: String, name: String, thumb: String) {
        self.id = id
        self.name = name
        self.thumb = thumb
    }
}
