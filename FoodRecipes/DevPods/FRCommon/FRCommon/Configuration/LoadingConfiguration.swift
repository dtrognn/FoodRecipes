//
//  LoadingConfiguration.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import Foundation

public protocol ILoadingConfiguration {
    func showLoading()
    func hideLoading()
}

public enum LoadingType {
    case defaultLoading
    case standard
    case custom
}

public class LoadingConfiguration {
    private init() {}
    public static let shared = LoadingConfiguration()
    private var loadingDict: [LoadingType: ILoadingConfiguration] = [:]

    public func addLoadingConfiguration(loadingType: LoadingType, loading: ILoadingConfiguration) {
        loadingDict[loadingType] = loading
    }

    public func showLoading(_ isShowLoading: Bool, loadingType: LoadingType = .defaultLoading) {
        if isShowLoading {
            loadingDict[loadingType]?.showLoading()
        } else {
            loadingDict[loadingType]?.hideLoading()
        }
    }
}
