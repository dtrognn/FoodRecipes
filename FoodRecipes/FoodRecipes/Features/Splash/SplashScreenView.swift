//
//  SplashScreenView.swift
//  FoodRecipes
//
//  Created by dtrognn on 10/8/24.
//

import FRCommon
import SwiftUI

struct SplashScreenView: View {
    private var screenConfiguration: ScreenConfiguration {
        .init(title: "", showBackButton: false, hidesBottomBarWhenPushed: false, showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()
                Image.image("ic_app_no_bg")
                    .resizable()
                    .frame(width: 300, height: 276)
                Spacer()
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
