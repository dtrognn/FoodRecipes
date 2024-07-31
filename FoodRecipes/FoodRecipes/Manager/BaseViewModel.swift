//
//  BaseViewModel.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Combine
import Foundation
import FRCommon
import FRCore

open class BaseStore: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []

    var isLoading = PassthroughSubject<Bool, Never>()

    open func showLoading(_ isLoading: Bool) {
        self.isLoading.send(isLoading)
        if showLoadingDefault() {
            LoadingConfiguration.shared.showLoading(isLoading)
        }
    }

    open func showLoadingDefault() -> Bool {
        return true
    }

    func handleError(_ error: Subscribers.Completion<APIError>) {
        switch error {
        case .finished:
            break
        case .failure(let error):
            print("AAA error: \(error.localizedDescription)")
        }
    }

    func showErrorMessage(_ errorMessage: String) {
        AlertMessageConfiguration.shared.showMessage(errorMessage, alertMessageType: .banner)
    }

    func showSuccessMessage(_ message: String) {
        AlertMessageConfiguration.shared.showMessage(message, alertMessageType: .banner, style: .success)
    }
}
