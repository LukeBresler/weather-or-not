//
//  WeatherView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//

import SwiftUI
import AVFoundation

struct WeatherView: View {
    @StateObject var weatherService = WeatherService()
    @State private var showSpeakerButton = false
    
    var body: some View {
        ZStack {
            if let currentWeather = weatherService.weatherData.first {
                
                let weatherStyle = WeatherBackground()
                    .style(for: currentWeather.weather.first?.main ?? "")
                
                weatherStyle.backgroundColour
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        weatherStyle.backgroundImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 330)
                            .clipped()
                            .edgesIgnoringSafeArea(.top)
                        
                        CurrentWeatherView(weather: currentWeather)
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
                        ForecastListView(weatherData: ForecastCalculator.getDailyForecasts(from: weatherService.weatherData))
                    }
                    .padding(.all)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            let speechService = WeatherSpeechService(weatherData: weatherService.weatherData)
                            speechService.speakWeatherInfo()
                        }) {
                            Image(systemName: "speaker.wave.2.circle")
                                .foregroundStyle(Color.white)
                                .frame(width: 60, height: 60)
                                .padding()
                        }
                        .accessibilityLabel("Hear weather forecast")
                        .accessibilityHint("Double-tap to hear the current weather and 5-day forecast.")
                    }
                    .opacity(showSpeakerButton ? 1 : 0)
                    .animation(.easeIn(duration: 1), value: showSpeakerButton)
                }
            } else {
                LoadingView(errorMessage: weatherService.errorMessage) {
                    weatherService.requestLocation()
                }
            }
        }
        .onAppear {
            weatherService.requestLocation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showSpeakerButton = true
            }
        }
    }
}
