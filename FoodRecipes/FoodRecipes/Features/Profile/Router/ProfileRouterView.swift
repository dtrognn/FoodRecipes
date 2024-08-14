//
//  ProfileRouterView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

class ProfileRouter: BaseRouter<ProfileRouter.Screen> {
    enum Screen: IScreen {
        case language
    }

    override func getInstanceScreen(_ screen: Screen) -> AnyView {
        switch screen {
        case .language:
            return ChangeLanguageView().environmentObject(self).asAnyView
        }
    }
}

struct ProfileRouterView: View {
    @StateObject private var router = ProfileRouter()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            ProfileView()
                .navigationDestination(for: ProfileRouter.Screen.self) { destination in
                    router.getInstanceScreen(destination)
                }
        }.environmentObject(router)
    }
}

#Preview {
    ProfileRouterView()
}
