//
//  ChangeLanguageView.swift
//  FoodRecipes
//
//  Created by dtrognn on 8/8/24.
//

import FRCommon
import SwiftUI

struct ChangeLanguageView: View {
    private var screenConfiguration: ScreenConfiguration {
        return .init(
            title: language("Language_A_01"),
            showBackButton: true,
            showNaviBar: true
        )
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                //
            }.padding(.all, AppStyle.layout.standardSpace)
        }
    }
}

#Preview {
    ChangeLanguageView()
}
