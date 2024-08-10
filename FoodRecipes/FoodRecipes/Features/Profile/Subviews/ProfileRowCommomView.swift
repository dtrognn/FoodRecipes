//
//  ProfileRowCommomView.swift
//  FoodRecipes
//
//  Created by dtrognn on 7/8/24.
//

import FRCommon
import SwiftUI

struct ProfileRowCommomView: View {
    private var image: Image
    private var title: String
    private var showBottomLine: Bool
    private var onClick: () -> Void

    init(image: Image, title: String, showBottomLine: Bool = true, onClick: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.onClick = onClick
        self.showBottomLine = showBottomLine
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onClick()
        } label: {
            VStack(spacing: AppStyle.layout.zero) {
                HStack(spacing: AppStyle.layout.mediumSpace) {
                    HStack(spacing: AppStyle.layout.standardSpace) {
                        leadingImage
                        titleText
                    }
                    Spacer()
                    arrowImage
                }.padding(.all, AppStyle.layout.standardSpace)
                if showBottomLine {
                    StraightLine()
                }
            }.background(AppStyle.theme.rowCommonBackgroundColor)
        }
    }
}

private extension ProfileRowCommomView {
    var titleText: some View {
        return Text(title)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .lineLimit(1)
    }

    var leadingImage: some View {
        return image
    }

    var arrowImage: some View {
        return Image.image("ic_arrow_right")
            .applyTheme()
    }
}
