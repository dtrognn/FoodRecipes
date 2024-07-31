//
//  View+Ext.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public struct ViewModifierBackground: ViewModifier {
    public var colorFill: Color
    public var cornerRadius: CGFloat
    public var shadowConfiguration: ShadowConfiguration

    public func body(content: Content) -> some View {
        content.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(colorFill)
                .shadow(color: shadowConfiguration.shadowColor,
                        radius: shadowConfiguration.shadowRadius)
        )
    }
}

public extension View {
    func applyShadowView(_ colorFill: Color = AppStyle.theme.rowCommonBackgroundColor, cornerRadius: CGFloat = AppStyle.layout.standardCornerRadius) -> some View {
        modifier(ViewModifierBackground(colorFill: colorFill, cornerRadius: cornerRadius, shadowConfiguration: ShadowConfiguration()))
    }

    var asAnyView: AnyView {
        return AnyView(self)
    }
}
