//
//  Instruction.swift
//  FoodRecipes
//
//  Created by dtrognn on 5/8/24.
//

import Foundation
import FRAPILayer

class InstructionItemData: Identifiable {
    let id: String = UUID().uuidString
    private var instruction: AnalyzedInstruction

    init(_ instruction: AnalyzedInstruction) {
        self.instruction = instruction
    }

    var name: String {
        return instruction.name
    }

    var steps: [InstructionStep] {
        return instruction.steps?.map { InstructionStep($0) } ?? []
    }
}

struct InstructionStep: Identifiable {
    let id: String = UUID().uuidString
    private var step: Step

    init(_ step: Step) {
        self.step = step
    }

    var number: Int {
        return step.number
    }

    var description: String {
        return step.step
    }

    var ingredients: [InstructionInfoCommonData] {
        return step.ingredients?.map { InstructionInfoCommonData($0) } ?? []
    }

    var length: Length? {
        return step.length
    }
}

class InstructionInfoCommonData: Identifiable {
    let id: String = UUID().uuidString
    private var data: Ent

    init(_ data: Ent) {
        self.data = data
    }

    var idInt: Int {
        return data.id
    }

    var name: String {
        return data.name
    }

    var image: String {
        return data.image
    }

    func getImageUrl(_ size: ImageSize = .small) -> String {
        let baseUrl = DefineConfiguration.imageBaseUrl
        let imageUrl = String(format: "%@/ingredients_%@/%@", baseUrl, size.rawValue, image)
        return imageUrl
    }
}
