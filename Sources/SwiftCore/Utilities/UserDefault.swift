//
//  UserDefault.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    
    public init(_ key: String, default value: T){
        self.key = key
        self.defaultValue = value
    }
    public var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}
