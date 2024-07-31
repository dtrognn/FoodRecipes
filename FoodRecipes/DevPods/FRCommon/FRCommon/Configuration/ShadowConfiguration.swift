//
//  ShadowConfiguration.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public struct ShadowConfiguration {
    public var shadowRadius: Double
    public var shadowColor: Color
    public var shadowX: Double
    public var shadowY: Double

    public init() {
        shadowRadius = 5.0
        shadowColor = AppStyle.theme.shadowColor
        shadowX = 0
        shadowY = 3
    }

    public init(shadowRadius: Double, shadowColor: Color, shadowX: Double, shadowY: Double) {
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor
        self.shadowX = shadowX
        self.shadowY = shadowY
    }
}
