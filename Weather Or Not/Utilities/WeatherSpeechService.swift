//
//  WeatherSpeechService.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/03/10.
//

import AVFoundation

class WeatherSpeechService {
    private let weatherData: [WeatherData]
    
    init(weatherData: [WeatherData]) {
        self.weatherData = weatherData
    }
    
    func speakWeatherInfo() {
        guard let currentWeather = weatherData.first else {
            return
        }
        
        // Current weather details
        let currentTemp = Int(currentWeather.main.temp)
        let highTemp = Int(currentWeather.main.temp_max)
        let lowTemp = Int(currentWeather.main.temp_min)
        let weatherDescription = currentWeather.weather.first?.description ?? "unknown"
        
        // Forecast details
        let dailyForecasts = ForecastCalculator.getDailyForecasts(from: weatherData)
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
