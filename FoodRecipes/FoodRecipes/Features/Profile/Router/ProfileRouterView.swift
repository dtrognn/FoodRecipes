//
//  ProfileRouterView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct ProfileRouterView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            ProfileView()
                .navigationDestination(for: ProfileDestination.self) { _ in
                    //
                }
        }.environmentObject(router)
    }
}

#Preview {
    ProfileRouterView()
}
