//
//  InstructionsView.swift
//  FoodRecipes
//
//  Created by dtrognn on 5/8/24.
//

import FRCommon
import SwiftUI

struct InstructionsView: View {
    private var instructions: [InstructionItemData]

    init(_ instructions: [InstructionItemData]) {
        self.instructions = instructions
    }

    var body: some View {
        VStack(alignment: .leading) {
            instructionsText

            LazyVStack(spacing: AppStyle.layout.standardSpace) {
                ForEach(instructions) { instruction in
                    InstructionItemView(instruction)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension InstructionsView {
    var instructionsText: some View {
        return Text(language("Recipe_Detail_A_10"))
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }
}
