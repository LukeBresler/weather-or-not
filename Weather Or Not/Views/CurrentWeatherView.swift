//
//  CurrentWeatherView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//
import SwiftUI

struct CurrentWeatherView: View {
    let weather: WeatherData
    
    var body: some View {
        VStack(spacing: 20) {
            // Current Temperature
            Text("\(Int(weather.main.temp))°")
                .font(.system(size: 96))
                .foregroundColor(.white)
            
            // Weather Description
            Text(weather.weather.first?.main.uppercased() ?? "")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.medium)
        }
    }
}
