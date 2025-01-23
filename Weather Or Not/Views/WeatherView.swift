//
//  WeatherView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//

import SwiftUI
import AVFoundation

struct WeatherView: View {
    @StateObject private var weatherService = WeatherService()
    @State private var showSpeakerButton = false
    
    var body: some View {
        ZStack {
            // Base background colour
            if let currentWeather = weatherService.weatherData.first {
                weatherBackgroundColour(for: currentWeather.weather.first?.main ?? "")
                    .edgesIgnoringSafeArea(.all)
            }
            if weatherService.weatherData.isEmpty {
                LoadingView(errorMessage: weatherService.errorMessage) {
                    weatherService.requestLocation()
                }
            } else {
                VStack {
                    // Top section with weather background image
                    if let currentWeather = weatherService.weatherData.first {
                        ZStack {
                            weatherBackgroundImage(for: currentWeather.weather.first?.main ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxHeight: 330)
                                .clipped()
                                .edgesIgnoringSafeArea(.top)
                            // Current weather content
                            VStack {
                                CurrentWeatherView(weather: currentWeather)
                            }
                        }
                        .frame(maxHeight: 330)
                        
                        VStack {
                            TemperatureRangeView(weather: currentWeather)
                        }
                        .padding(.top, -30)
                        .padding(.bottom, 10)
                        Divider()
                            .frame(height: 2)
                            .background(Color.white)
                            .padding(.horizontal)
                        ScrollView {
                            ForecastListView(weatherData: getDailyForecasts(from: weatherService.weatherData))
                        }
                        .padding(.all)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            speakWeatherInfo()
                        }) { Image(systemName: "speaker.wave.2.circle")
                                .foregroundStyle(Color.white)
                                .frame(width: 60, height: 60)
                                .padding()
                        }
                        .accessibilityLabel("Hear weather forecast")
                        .accessibilityHint("Double-tap to hear the current weather and 5 day forecast.")
                    }
                    .opacity(showSpeakerButton ? 1 : 0)
                    .animation(.easeIn(duration: 1), value: showSpeakerButton)
                }
            }
        }
        .onAppear {
            weatherService.requestLocation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
                showSpeakerButton = true
            }
        }
    }
    
    private func weatherBackgroundColour(for weatherMain: String) -> Color {
        switch weatherMain.lowercased() {
        case "clouds":
            return Color("cloudy")
        case "rain":
            return Color("rainy")
        case "clear":
            return Color("clearSky")
        default:
            return Color("clearSky")
        }
    }
    
    private func weatherBackgroundImage(for weatherMain: String) -> Image {
        switch weatherMain.lowercased() {
        case "clouds":
            return Image("sea_cloudy")
        case "rain":
            return Image("sea_rainy")
        case "clear":
            return Image("sea_sunny")
        default:
            return Image("sea_sunny") // Default to sunny if unrecognized
        }
    }
    
    private func getDailyForecasts(from weatherData: [WeatherData]) -> [WeatherData] {
        // Group forecasts by day and take the noon forecast for each day
        let calendar = Calendar.current
        var dailyForecasts: [WeatherData] = []
        let groupedByDay = Dictionary(grouping: weatherData) { weather in
            calendar.startOfDay(for: weather.date)
        }
        
        // Sort days and take one reading per day (preferably around noon)
        let sortedDays = groupedByDay.keys.sorted()
        for day in sortedDays.prefix(5) {
            if let forecasts = groupedByDay[day] {
                // Try to get the forecast closest to noon
                let noonForecast = forecasts.min(by: { forecast1, forecast2 in
                    let hour1 = calendar.component(.hour, from: forecast1.date)
                    let hour2 = calendar.component(.hour, from: forecast2.date)
                    return abs(hour1 - 12) < abs(hour2 - 12)
                })
                if let forecast = noonForecast {
                    dailyForecasts.append(forecast)
                }
            }
        }
        return dailyForecasts
    }
    
    func speakWeatherInfo() {
        guard let currentWeather = weatherService.weatherData.first else {
            return
        }
        
        // Current weather details
        let currentTemp = Int(currentWeather.main.temp)
        let highTemp = Int(currentWeather.main.temp_max)
        let lowTemp = Int(currentWeather.main.temp_min)
        let weatherDescription = currentWeather.weather.first?.description ?? "unknown"
        
        // Forecast details
        let dailyForecasts = getDailyForecasts(from: weatherService.weatherData)
        var forecastString = "The 5-day forecast is: "
        
        for (index, forecast) in dailyForecasts.enumerated() {
            let day = index == 0 ? "Today" : Calendar.current.weekdaySymbols[Calendar.current.component(.weekday, from: forecast.date) - 1]
            let temp = Int(forecast.main.temp)
            let description = forecast.weather.first?.description ?? "unknown weather"
            
            forecastString += "\(day), \(description), \(temp) degrees. "
        }
        
        let weatherInfo = """
        The current temperature is \(currentTemp) degrees Celsius with \(weatherDescription).
        Today's high is \(highTemp) degrees, with a low of \(lowTemp) degrees.
        \(forecastString)
        """
        
        let utterance = AVSpeechUtterance(string: weatherInfo)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
