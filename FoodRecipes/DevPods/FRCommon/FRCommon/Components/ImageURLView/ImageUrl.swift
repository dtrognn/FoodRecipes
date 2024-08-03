//
//  ImageUrl.swift
//  FRCommon
//
//  Created by dtrognn on 3/8/24.
//

import Kingfisher
import SwiftUI

public enum ImageContentMode {
    case fit
    case fill
}

public struct ImageUrl<Content: View>: View {
    private var urlString: String
    private var contentMode: ImageContentMode
    private var onLoadError: (() -> Void)?
    private var placeholder: () -> Content

    public init(urlString: String, contentMode: ImageContentMode = .fit, onLoadError: (() -> Void)? = nil, placeholder: @escaping () -> Content) {
        self.urlString = urlString
        self.contentMode = contentMode
        self.onLoadError = onLoadError
        self.placeholder = placeholder
    }

    public var body: some View {
        if let url = URL(string: urlString) {
            KFImage.url(url)
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .placeholder(placeholder)
                .onFailure { _ in
                    onLoadError?()
                }.resizable()
                .aspectRatio(contentMode: contentMode == .fit ? .fit : .fill)
        }
    }
}
