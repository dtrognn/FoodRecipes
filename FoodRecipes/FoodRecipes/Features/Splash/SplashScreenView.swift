//
//  SplashScreenView.swift
//  FoodRecipes
//
//  Created by dtrognn on 10/8/24.
//

import FRCommon
import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject private var appRouter: AppRouter

    var body: some View {
        ZStack {
            AppStyle.theme.splashBackgroundColor

            VStack {
                Spacer()
                Image.image("ic_app_no_bg")
                    .resizable()
                    .frame(width: 300, height: 276)

                Spacer()
            }
        }.ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    appRouter.updateScreen(isLoggedIn: AppDataManager.shared.isLogout)
                }
            }
    }
}

#Preview {
    SplashScreenView()
}
