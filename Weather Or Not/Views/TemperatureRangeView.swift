//
//  TemperatureRangeView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//
import SwiftUI

struct TemperatureRangeView: View {
   // let weather: WeatherData
    
    var body: some View {
        HStack {
            // Minimum Temperature
            VStack {
                Text("14°")
                    .font(.title2)
                Text("min")
                    .font(.caption)
            }
            
            Spacer()
            
            // Current Temperature
            VStack {
                Text("24°")
                    .font(.title2)
                Text("Current")
                    .font(.caption)
            }
            
            Spacer()
            
            // Maximum Temperature
            VStack {
                Text("29°")
                    .font(.title2)
                Text("max")
                    .font(.caption)
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
    }
}
