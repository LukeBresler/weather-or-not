//
//  TemperatureRangeView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//
import SwiftUI

struct TemperatureRangeView: View {
    let weather: WeatherData
    
    var body: some View {
        HStack {
            // Minimum Temperature
            VStack {
                Text("\(Int(weather.main.temp_min))°")
                    .font(.title2)
                Text("min")
                    .font(.caption)
            }
            Spacer()
            // Current Temperature
            VStack {
                Text("\(Int(weather.main.temp))°")
                    .font(.title2)
                Text("Current")
                    .font(.caption)
            }
            Spacer()
            // Maximum Temperature
            VStack {
                Text("\(Int(weather.main.temp_max))°")
                    .font(.title2)
                Text("max")
                    .font(.caption)
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
    }
}
