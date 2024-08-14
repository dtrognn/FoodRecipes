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

struct ShadowModifier: ViewModifier {
    private var colorFill: Color
    private var cornerRadius: CGFloat
    private var shadowConfiguration: ShadowConfiguration

    init(colorFill: Color, cornerRadius: CGFloat, shadowConfiguration: ShadowConfiguration) {
        self.colorFill = colorFill
        self.cornerRadius = cornerRadius
        self.shadowConfiguration = shadowConfiguration
    }

    func body(content: Content) -> some View {
        content
            .shadow(color: colorFill, radius: cornerRadius, x: shadowConfiguration.shadowX, y: shadowConfiguration.shadowY)
    }
}

public extension View {
//    func applyShadowView(_ colorFill: Color = AppStyle.theme.shadowColor, cornerRadius: CGFloat = AppStyle.layout.standardCornerRadius) -> some View {
//        modifier(ViewModifierBackground(colorFill: colorFill, cornerRadius: cornerRadius, shadowConfiguration: ShadowConfiguration()))
//    }

    func applyShadowView(_ colorFill: Color = AppStyle.theme.shadowColor, cornerRadius: CGFloat = AppStyle.layout.standardCornerRadius) -> some View {
        return modifier(ShadowModifier(colorFill: colorFill, cornerRadius: cornerRadius, shadowConfiguration: ShadowConfiguration()))
    }

    var asAnyView: AnyView {
        return AnyView(self)
    }

    func hidden(_ isHidden: Bool) -> some View {
        modifier(HiddenModifier(isHidden: isHidden))
    }
}
