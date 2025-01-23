//
//  WeatherService.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/22.
//

import Foundation
import CoreLocation
import UIKit

class WeatherService: NSObject, ObservableObject {
    @Published var weatherData: [WeatherData] = []
    @Published var location: CLLocation?
    @Published var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    private let locationService: LocationServiceProtocol
    private let configuration: ConfigurationProtocol
    
    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        locationService: LocationServiceProtocol = LocationService(),
        configuration: ConfigurationProtocol = Configuration.default
    ) {
        self.networkService = networkService
        self.locationService = locationService
        self.configuration = configuration
        super.init()
        self.locationService.delegate = self
    }
    
    func requestLocation() {
        locationService.requestLocationPermission()
        locationService.requestLocation()
    }
    
    private func fetchWeather(for location: CLLocation) async {
        let urlString = "\(configuration.weatherBaseURL)/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(configuration.weatherAPIKey)"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.errorMessage = "Invalid URL"
            }
            return
        }
        
        do {
            var response: WeatherResponse = try await networkService.fetch(from: url)
            
            // Convert temperatures from Kelvin to Celsius
                   response.list = response.list.map { weatherData in
                       var mutableWeatherData = weatherData
                       mutableWeatherData.main.temp -= 273.15
                       mutableWeatherData.main.temp_min -= 273.15
                       mutableWeatherData.main.temp_max -= 273.15
                       mutableWeatherData.main.feels_like -= 273.15
                       return mutableWeatherData
                   }
            
            DispatchQueue.main.async {
                self.weatherData = response.list
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

extension WeatherService: LocationServiceDelegate {
    func locationService(_ service: LocationServiceProtocol, didUpdateLocation location: CLLocation) {
        self.location = location
        Task {
            await fetchWeather(for: location)
        }
    }
    
    func locationService(_ service: LocationServiceProtocol, didFailWith error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}
