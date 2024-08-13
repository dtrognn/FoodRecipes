//
//  AppState.swift
//  FoodRecipes
//
//  Created by dtrognn on 10/8/24.
//

import Foundation

struct AppState {
    var loginState: LoginState = .init()
}

public class LoginState: ObservableObject {
    @Published var loggedIn: Bool = true
    @Published var userName: String?

    init() {
        loggedIn = AuthServiceManager.share.userSesstion != nil
    }
}
