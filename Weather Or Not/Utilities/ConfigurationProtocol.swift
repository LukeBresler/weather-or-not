//
//  ConfigurationProtocol.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/22.
//
import Foundation
import CoreLocation

protocol ConfigurationProtocol {
    var weatherAPIKey: String { get }
    var weatherBaseURL: String { get }
}

struct Configuration: ConfigurationProtocol {
    let weatherAPIKey: String
    let weatherBaseURL: String
    
    static let `default` = Configuration(
        weatherAPIKey: "b5520d58a1170cdcbce2a68d87703ce3",
        weatherBaseURL: "https://api.openweathermap.org/data/2.5"
    )
}
