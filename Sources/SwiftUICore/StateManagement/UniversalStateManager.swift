//
//  UniversalStateManager.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Foundation

public enum LoadState<Value>: Sendable where Value: Sendable {
    case idle
    case loading
    case loaded(Value)
    case failed(Error)
}

@MainActor
open class UniversalStateManager<Value: Sendable>: ObservableObject {
    @Published public private(set) var state: LoadState<Value> = .idle
    
    public init() {}
    open func load(_ work: @Sendable @escaping () async throws -> Value) {
        self.state = .loading
        
        Task.detached {
            do {
                let value = try await work()
                await MainActor.run { [weak self] in
                    self?.state = .loaded(value)
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.state = .failed(error)
                }
            }
        }
    }
    
}
