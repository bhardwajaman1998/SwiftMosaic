//
//  BaseViewModal.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Foundation

public protocol ViewModel {
    associatedtype State
    var state: State { get set }
    func bind()
}

open class BaseViewModel<State>: ViewModel {
    public var state: State
    
    public init(initialState: State) {
        self.state = initialState
    }
    
    open func bind() {}
}
