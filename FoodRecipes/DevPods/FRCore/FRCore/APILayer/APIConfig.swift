//
//  APIConfig.swift
//  FRCore
//
//  Created by dtrognn on 2/8/24.
//

import Foundation

public enum Header {
    public static let ContentType = "Content-Type"
    public static let Accept = "Accept"
    public static let Authorization = "Authorization"
    public static let ApplicationFormUrlencoded = "application/x-www-form-urlencoded"
    public static let ApplicationFormData = "application/form-data"
    public static let ApplicationJson = "application/json"
    public static let MultipartFormData = "multipart/form-data"
    public static let TextHtml = "text/html"
    public static let Language = "Accept-Language"
    public static let APIKey = "x-api-key"

    public static let DeviceName = "DeviceName"
    public static let Platform = "Platform"
    public static let Identifier = "Identifier"
    public static let AppName = "AppName"
    public static let Version = "Version"
}
