//
//  AppStyle.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public struct AppStyle {
    private static var lightTheme: IFRTheme = AppLightTheme()
    private static var darkTheme: IFRTheme = AppDarkTheme()

    public static var font: IFRFont = FRFont()
    public static var layout: IFRLayout = FRLayout()
    public static var theme: IFRTheme = lightTheme

    public static var isDarkMode: Bool = false {
        didSet {
            theme = isDarkMode ? darkTheme : lightTheme
            UITabBar.appearance().backgroundColor = theme.tabbarBackgroundViewColor.asUIColor()
        }
    }

    public init() {}
}
