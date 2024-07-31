//
//  FRScrollView.swift
//  FRCommon
//
//  Created by dtrognn on 31/7/24.
//

import SwiftUI

public struct FRScrollView<Content: View>: View {
    private var content: () -> Content

    public init(_ content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            content()
        }
    }
}
