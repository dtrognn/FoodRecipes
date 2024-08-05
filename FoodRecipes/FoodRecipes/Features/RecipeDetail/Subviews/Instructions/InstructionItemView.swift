//
//  InstructionItemView.swift
//  FoodRecipes
//
//  Created by dtrognn on 5/8/24.
//

import FRCommon
import SwiftUI

struct InstructionItemView: View {
    private var instruction: InstructionItemData

    init(_ instruction: InstructionItemData) {
        self.instruction = instruction
    }

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.layout.mediumSpace) {
            if !instruction.name.isEmpty {
                instructionNameText
            }

            LazyVStack(spacing: AppStyle.layout.standardSpace) {
                ForEach(instruction.steps) { step in
                    InstructionStepItemView(step)
                }
            }
        }
    }
}

private extension InstructionItemView {
    var instructionNameText: some View {
        return Text(instruction.name)
            .font(AppStyle.font.regular16)
            .foregroundStyle(AppStyle.theme.textNormalColor)
    }
}
