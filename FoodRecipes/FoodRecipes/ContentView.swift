//
//  ContentView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct ContentView: View {
    var screenConfiguration: ScreenConfiguration {
        .init(title: "Home",
              showBackButton: true,
              showNaviBar: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                //
            }
        }
    }
}

#Preview {
    ContentView()
}
