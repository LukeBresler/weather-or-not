//
//  NetworkServiceProtocol.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/22.
//
import Foundation
import CoreLocation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from url: URL) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
