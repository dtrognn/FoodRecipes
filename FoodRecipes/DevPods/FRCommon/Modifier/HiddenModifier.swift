//
//  HiddenModifier.swift
//  FRCommon
//
//  Created by dtrognn on 8/8/24.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    let isHidden: Bool

    func body(content: Content) -> some View {
        content.opacity(isHidden ? 0 : 1)
            .disabled(isHidden)
    }
}
