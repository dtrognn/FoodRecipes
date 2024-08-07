//
//  ProfileView.swift
//  FoodRecipes
//
//  Created by dtrognn on 7/8/24.
//

import FRCommon
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var router: Router

    private var screenConfiguration: ScreenConfiguration {
        .init(title: "", showBackButton: false, hidesBottomBarWhenPushed: false, showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            FRScrollView {
                VStack {
                    //
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
