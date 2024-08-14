//
//  LoginView.swift
//  FoodRecipes
//
//  Created by dtrognn on 11/8/24.
//

import FRCommon
import SwiftUI

struct LoginView: View {
    private var screenConfiguration: ScreenConfiguration {
        .init(title: "", showBackButton: false, hidesBottomBarWhenPushed: false, showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()
                Text("Login view")
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
