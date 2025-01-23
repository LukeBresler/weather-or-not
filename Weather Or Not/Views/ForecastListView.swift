//
//  ForecastListView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//
import SwiftUI

struct ForecastListView: View {
    let weatherData: [WeatherData]
    @StateObject private var weatherService = WeatherService()
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(weatherData) { weather in
                HStack {
                    Text(getDayOfWeek(from: weather.date))
                        .frame(width: 150, alignment: .leading)
                    
                    weatherIcon(for: weather.weather.first?.main ?? "")
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
    
    private func getDayOfWeek(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
    private func weatherIcon(for weatherMain: String) -> Image {
        switch weatherMain.lowercased() {
        case "clouds":
            return Image("partlysunny")
        case "rain":
            return Image("rain")
        case "clear":
            return Image("clear")
        default:
            return Image("sunny")
            
        }
    }
}
