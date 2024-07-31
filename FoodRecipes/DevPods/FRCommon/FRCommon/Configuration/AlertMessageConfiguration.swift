//
//  AlertMessageConfiguration.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public enum AlertMessageStyle {
    case danger
    case info
    case customView
    case success
    case warning
}

public enum AlertMessageType {
    case defaultAlert
    case banner
    case custom
}

public protocol IAlertMessage: AnyObject {
    func showMessage(_ message: String, style: AlertMessageStyle)
}

public class AlertMessageConfiguration {
    public static let shared = AlertMessageConfiguration()

    private var alertMessageDict: [AlertMessageType: IAlertMessage] = [:]

    public func addAlertMessage(_ alertMessageType: AlertMessageType, alertMessage: IAlertMessage) {
        alertMessageDict[alertMessageType] = alertMessage
    }

    public func showMessage(_ message: String, alertMessageType: AlertMessageType = .defaultAlert, style: AlertMessageStyle = .info) {
        alertMessageDict[alertMessageType]?.showMessage(message, style: style)
    }
}
