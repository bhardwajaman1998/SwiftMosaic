//
//  Animations.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-09.
//

import SwiftUI

public extension AnyTransition {
    static var fade: AnyTransition {
        .opacity.animation(.easeInOut(duration: 0.3))
    }

    static var slide: AnyTransition {
        .move(edge: .trailing).combined(with: .opacity)
            .animation(.easeInOut(duration: 0.4))
    }

    static var scale: AnyTransition {
        .scale(scale: 0.95).combined(with: .opacity)
            .animation(.spring(response: 0.5, dampingFraction: 0.7))
    }
}
