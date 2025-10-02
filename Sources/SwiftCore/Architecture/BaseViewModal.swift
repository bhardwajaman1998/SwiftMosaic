//
//  BaseViewModal.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Foundation

public protocol ViewModal {
    associatedType State
    var state: State { get set }
    func bind()
}

open class BaseViewModal<State>: ViewModal {
    public var state: State
    
    public init(initializeState: State) {
        self.state = initializeState
    }
    
    open func bind() {}
}
