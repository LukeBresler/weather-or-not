//
//  ForecastListView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//
import SwiftUI

struct ForecastListView: View {
    let weatherData: [WeatherData]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(weatherData) { weather in
                HStack {
                    Text(DateFormatterUtility.getDayOfWeek(from: weather.date))
                        .frame(width: 150, alignment: .leading)
                    
                    WeatherIconProvider.weatherIcon(for: weather.weather.first?.main ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Spacer()
                    Text("\(Int(weather.main.temp))°")
                }
                .foregroundColor(.white)
                .font(.title3)
            }
        }
        .padding(.horizontal)
    }
}
