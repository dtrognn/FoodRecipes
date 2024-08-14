//
//  AuthServiceManager.swift
//  FoodRecipes
//
//  Created by dtrognn on 10/8/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class AuthServiceManager: BaseViewModel {
    static let share = AuthServiceManager()

    @Published var userSesstion: FirebaseAuth.User?

    private var firestore = Firestore.firestore()

    func loadUser() {
        self.userSesstion = Auth.auth().currentUser
    }
}
