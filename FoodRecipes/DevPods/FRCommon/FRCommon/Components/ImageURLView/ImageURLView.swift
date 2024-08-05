//
//  ImageURLView.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SDWebImageSwiftUI
import SwiftUI

public struct ImageURLView: View {
    private var urlString: String

    public init(_ urlString: String) {
        self.urlString = urlString
    }

    public var body: some View {
        if let url = URL(string: urlString) {
            WebImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
    }
}
