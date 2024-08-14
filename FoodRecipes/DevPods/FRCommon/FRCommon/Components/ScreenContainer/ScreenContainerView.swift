//
//  ScreenContainerView.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public struct ScreenContainerView<Content: View>: View {
    @ObservedObject public var screenConfiguration: ScreenConfiguration
    public var content: () -> Content

    public init(_ screenConfiguration: ScreenConfiguration,
                content: @escaping () -> Content)
    {
        self.screenConfiguration = screenConfiguration
        self.content = content
    }

    public var body: some View {
        bodyView
    }

    var bodyView: some View {
        return ZStack(alignment: .top) {
            LinearGradient(colors: [AppStyle.theme.backgroundColor, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: AppStyle.layout.zero) {
                if screenConfiguration.showNaviBar {
                    NaviBarView(screenConfiguration: screenConfiguration)
                }
                content()
                    .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                    .navigationBarHidden(true)
                    .toolbar(screenConfiguration.hidesBottomBarWhenPushed ? .hidden : .visible, for: .tabBar)
                    .onDisappear {
                        if screenConfiguration.hidesBottomBarWhenPushed == true {
                            screenConfiguration.hidesBottomBarWhenPushed = false
                        }
                    }
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}
