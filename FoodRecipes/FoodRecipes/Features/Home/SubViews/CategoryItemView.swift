//
//  CategoryItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct CategoryItemView: View {
    private var data: CategoryItemViewData
    private var onCLick: (CategoryItemViewData) -> Void

    init(_ data: CategoryItemViewData, onCLick: @escaping (CategoryItemViewData) -> Void) {
        self.data = data
        self.onCLick = onCLick
    }

    var body: some View {
        Button {
            Vibration.selection.vibrate()
            onCLick(data)
        } label: {
            VStack(spacing: AppStyle.layout.zero) {
                VStack(spacing: AppStyle.layout.standardSpace) {
                    thumbView
                    categoryNameText
                }.padding(.all, AppStyle.layout.standardSpace)
            }.applyShadowView()
        }
    }
}

private extension CategoryItemView {
    var categoryNameText: some View {
        return Text(data.name)
            .font(AppStyle.font.semibold20)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .lineLimit(1)
    }

    var thumbView: some View {
        return ImageURLView(data.thumb)
    }
}
