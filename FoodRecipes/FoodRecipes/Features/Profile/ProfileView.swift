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
                    Spacer()
                    Group {
                        settingRowView
                    }.cornerRadius(AppStyle.layout.standardCornerRadius)
                        .applyShadowView()
                    Spacer()
                }.padding(.all, AppStyle.layout.standardSpace)
            }
        }
    }
}

private extension ProfileView {
    var settingRowView: some View {
        return ProfileRowCommomView(image: .image("ic_language"), title: language("Profile_A_01"), showBottomLine: false) {
            router.push(to: ProfileDestination.language)
        }
    }
}

#Preview {
    ProfileView()
}
