//
//  GCDHelper.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-05.
//

import Foundation

// Global helper for dispatching to main thread safely
@inlinable
public func mainAsync(_ work: @escaping @Sendable () -> Void) {
    if Thread.isMainThread { work() }
    else { DispatchQueue.main.async(execute: work) }
}

// Execute work on a background queue
@inlinable
public func background(_ work: @escaping @Sendable () -> Void) {
    DispatchQueue.global(qos: .background).async(execute: work)
}

// Run a closure after a delay (seconds)
@inlinable
public func after(_ seconds: Double, _ work: @escaping @Sendable () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: work)
}

// Execute a task synchronously on main thread if already on main; otherwise dispatch async and wait.
@discardableResult
public func mainSync<T>(_ work: @Sendable () -> T) -> T {
    if Thread.isMainThread { return work() }
    return DispatchQueue.main.sync(execute: work)
}
