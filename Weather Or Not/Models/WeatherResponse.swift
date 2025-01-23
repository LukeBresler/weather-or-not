//
//  WeatherResponse.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/22.
//

import Foundation

struct WeatherResponse: Codable {
    var list: [WeatherData]
}

struct WeatherData: Codable, Identifiable {
    var dt: Int
    var main: MainWeather
    var weather: [Weather]
    
    var id: Int { dt }
    
    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(dt))
    }
}

struct MainWeather: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var humidity: Int
    
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
