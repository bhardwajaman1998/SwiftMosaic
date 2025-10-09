//
//  OptionalItem.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-09.
//

// Helper for optional item sheet presentations

import SwiftUI
public extension View {
    func sheet<Item, Content: View>(
        item: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View {
        self.sheet(item: item) { item in
            content(item)
        }
    }
}
