//
//  WeatherBackground.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/03/10.
//

import Foundation
import SwiftUI

protocol WeatherStyleStrategy {
    var backgroundColour: Color { get }
    var backgroundImage: Image { get }
}

struct CloudyWeatherStyle: WeatherStyleStrategy {
    var backgroundColour: Color { Color("cloudy")}
    var backgroundImage: Image { Image("sea_cloudy")}
}

struct RainyWeatherStyle: WeatherStyleStrategy {
    var backgroundColour: Color { Color("rainy")}
    var backgroundImage: Image { Image("sea_rainy")}
}

struct ClearWeatherStyle: WeatherStyleStrategy {
    var backgroundColour: Color { Color("clearSky")}
    var backgroundImage: Image { Image("sea_sunny")}
}

class WeatherBackground {
    func style(for WeatherMain: String) -> WeatherStyleStrategy {
        switch WeatherMain.lowercased() {
        case "clouds":
            return CloudyWeatherStyle()
        case "rain":
            return RainyWeatherStyle()
        case "clear":
            return ClearWeatherStyle()
        default:
            return ClearWeatherStyle()
        }
    }
}
