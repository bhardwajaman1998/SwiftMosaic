//
//  BooleanBinding.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-09.
//

// Wraps a Bool binding and exposes toggle helpers
import SwiftUI
public struct BooleanBinding {
    public var value: Binding<Bool>
    public init(_ value: Binding<Bool>) { self.value = value }
    public func toggle() { value.wrappedValue.toggle() }
    public func set(_ new: Bool) { value.wrappedValue = new }
}
