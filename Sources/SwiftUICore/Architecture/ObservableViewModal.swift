//
//  ObservableViewModal.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Combine
import Foundation

open class ObservableViewModal<State>: ObservableObject {
    @Published public private(set) var state: State
    
    public init(initialState: State) {
        self.state = initialState
    }
    open func update(_ mutate: (inout State) -> Void){
        mutate(&state)
    }
}
