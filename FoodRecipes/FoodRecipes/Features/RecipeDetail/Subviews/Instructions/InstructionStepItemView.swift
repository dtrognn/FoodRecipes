//
//  InstructionStepItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 5/8/24.
//

import FRCommon
import SwiftUI

struct InstructionStepItemView: View {
    private var step: InstructionStep

    init(_ step: InstructionStep) {
        self.step = step
    }

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.layout.mediumSpace) {
            stepText
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension InstructionStepItemView {
    var stepText: some View {
        let boldText = Text(String(format: "%@ %d: ", language("Recipe_Detail_A_11"), step.number))
            .font(AppStyle.font.medium16)
        let normalText = Text(step.description)
            .font(AppStyle.font.regular16)

        let lengthInfoText = Text((step.length == nil) ? "" : String(format: " (%d %@)", step.length?.number ?? 0, step.length?.unit ?? ""))
            .font(AppStyle.font.regular14)

        return (boldText + normalText + lengthInfoText)
            .foregroundStyle(AppStyle.theme.textNormalColor)
            .lineSpacing(AppStyle.layout.lineSpacing)
            .multilineTextAlignment(.leading)
    }
}
