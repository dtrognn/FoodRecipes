//
//  Progress+Ext.swift
//  FRCommon
//
//  Created by dtrognn on 3/8/24.
//

import SwiftUI

public extension ProgressView {
    func applyTheme(_ color: Color = AppStyle.theme.iconColor) -> some View {
        self.progressViewStyle(CircularProgressViewStyle(tint: color))
    }
}
