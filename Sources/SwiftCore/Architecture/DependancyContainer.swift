//
//  DependancyContainer.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-03.
//
import Foundation

public final class DependancyContainer: @unchecked Sendable {
    public static let shared = DependancyContainer()
    private var factories: [String: () -> Any] = [:]
    private let lock = NSLock()
    
    private init() {}
    
    public func register<Service>(_ type: Service.Type, factory: @escaping () -> Service){
        let key = "\(type)"
        lock.lock()
        defer { lock.unlock() }
        factories[key] = factory
    }
    public func resolve<Service>(_ type: Service.Type) -> Service {
        let key = "\(type)"
        lock.lock()
        let factory = factories[key]
        lock.unlock()
        guard let service = factory?() as? Service else {
            fatalError("No registered dependency for \(type)")
        }
        return service
    }
}

