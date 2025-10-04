//
//  APIService.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-03.
//

import Foundation

public protocol APIService {
    func fetchData(from url: String) async throws -> Data
}

public final class DefaultAPIService: APIService {
    
    public init() {}
    public func fetchData(from url: String) async throws -> Data {
        guard let u = URL(string: url) else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: u)
        return data
    }
}
