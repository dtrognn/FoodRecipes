//
//  ScreenConfiguration.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public class ScreenConfiguration: ObservableObject {
    @Published public var title: String
    @Published public var showBackButton: Bool
    @Published public var hidesBottomBarWhenPushed: Bool
    @Published public var showNaviUnderline: Bool
    @Published public var showNaviBar: Bool
    @Published public var onBackAction: (() -> Void)?

    public init(title: String,
                showBackButton: Bool = true,
                hidesBottomBarWhenPushed: Bool = true,
                showNaviUnderline: Bool = true,
                showNaviBar: Bool = false,
                onBackAction: (() -> Void)? = nil)
    {
        self.title = title
        self.showBackButton = showBackButton
        self.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        self.showNaviUnderline = showNaviUnderline
        self.showNaviBar = showNaviBar
        self.onBackAction = onBackAction
    }
}
