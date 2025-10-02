//
//  AppCoordinator.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import UIKit

public protocol Coordinating: AnyObject {
    var window: UIWindow? { get }
    func start()
}

open class AppCoordinator: Coordinating {
    public let window: UIWindow?
    
    public init(window: UIWindow?) {
        self.window = window
    }
    open func start() {
        //override in the app
    }
}
