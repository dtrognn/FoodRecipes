//
//  FRLayout.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public protocol IFRLayout {
    var zero: CGFloat { get }
    var smallSpace: CGFloat { get }
    var lineSpacing: CGFloat { get }
    var mediumSpace: CGFloat { get }
    var standardSpace: CGFloat { get }
    var largeSpace: CGFloat { get }
    var hugeSpace: CGFloat { get }
    var bottomButtonSpace: CGFloat { get }
    var standardButtonHeight: CGFloat { get }
    var standardCornerRadius: CGFloat { get }
    var largeCornerRadius: CGFloat { get }
}

public struct FRLayout: IFRLayout {
    public var zero: CGFloat { 0.0 }
    public var smallSpace: CGFloat { 4.0 }
    public var lineSpacing: CGFloat { 6.0 }
    public var mediumSpace: CGFloat { 8.0 }
    public var standardSpace: CGFloat { 16.0 }
    public var largeSpace: CGFloat { 24.0 }
    public var hugeSpace: CGFloat { 32.0 }
    public var bottomButtonSpace: CGFloat { 44.0 }
    public var standardButtonHeight: CGFloat { 44.0 }
    public var standardCornerRadius: CGFloat { 8.0 }
    public var largeCornerRadius: CGFloat { 16.0 }
}
