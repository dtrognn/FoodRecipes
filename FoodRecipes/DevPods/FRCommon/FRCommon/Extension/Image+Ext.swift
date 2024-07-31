//
//  Image+Ext.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public extension Image {
    func applyTheme(_ color: Color = AppStyle.theme.iconColor) -> some View {
        self.renderingMode(.template)
            .foregroundColor(color)
    }
}
