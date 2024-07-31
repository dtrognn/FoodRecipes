//
//  BaseViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation
import FRCore

open class BaseStore: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []

    func handleError(_ error: Subscribers.Completion<APIError>) {
        switch error {
        case .finished:
            break
        case .failure(let error):
            print("AAA error: \(error.localizedDescription)")
        }
    }
}
