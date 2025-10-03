//
//  EnumRouter.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Foundation

public protocol Route: Hashable {}

open class EnumRouter<R: Route>: ObservableObject {
    @Published public var path: [R] = []
    
    public init() {}
    public func push(_ r: R) {
        path.append(r)
    }
    public func pop() {
        _ = path.popLast()
    }
    public func reset() {
        path.removeAll()
    }
}
