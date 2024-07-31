//
//  NaviBarView.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

struct NaviBarView: View {
    @EnvironmentObject private var router: Router
    @ObservedObject private var screenConfiguration: ScreenConfiguration

    init(screenConfiguration: ScreenConfiguration) {
        self.screenConfiguration = screenConfiguration
    }

    var body: some View {
        VStack(spacing: AppStyle.layout.zero) {
            HStack {
                if screenConfiguration.showBackButton {
                    backButton
                }
                Spacer()
                titleSection
                Spacer()

                backButton.opacity(0)
            }.padding(AppStyle.layout.standardSpace)
                .navigationBarHidden(true)
                .background(
                    AppStyle.theme.naviBackgroundColor
                        .ignoresSafeArea(edges: .top)
                )
            if screenConfiguration.showNaviUnderline {
                StraightLine()
            }
        }
    }
}

private extension NaviBarView {
    private var backButton: some View {
        return Button {
            if screenConfiguration.onBackAction != nil {
                screenConfiguration.onBackAction?()
            } else {
                self.router.popView()
            }
        } label: {
            Image.image("ic_arrow_back_2")
                .resizable()
                .applyTheme(AppStyle.theme.naviBackIconColor)
                .frame(width: 22, height: 22)
        }
    }

    var titleSection: some View {
        return VStack {
            Text(LocalizedStringKey(screenConfiguration.title))
                .foregroundColor(AppStyle.theme.naviTextColor)
                .font(AppStyle.font.semibold16)
                .lineLimit(1)
        }
    }
}
