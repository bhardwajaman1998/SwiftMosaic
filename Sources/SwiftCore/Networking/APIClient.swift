//
//  APIClient.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-02.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case transport(Error)
    case decode(Error)
    case badStatus(Int)
}

public protocol APIClient {
    func get<T: Decodable>(_ url: String) async throws -> T
}

public final class URLSessionClient: APIClient {
    public init() {}
    public func get<T: Decodable>(_ url: String) async throws -> T {
        guard let u = URL(String: url) else { throw APIError.invalidURL}
        let (data, resp) = try await URLSession.shared.data(from: u)
        guard let http = resp as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw APIError.badStatus((resp as? HTTPURLResponse)?.statusCode ?? -1)
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decode(error)
        }
    }
}
