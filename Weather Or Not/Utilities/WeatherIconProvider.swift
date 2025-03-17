//
//  WeatherIconProvider.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/03/11.
//

import Foundation
import SwiftUI

class WeatherIconProvider {
    static func weatherIcon(for weatherMain: String?) -> Image {
        guard let weatherMain = weatherMain else {
            return Image("sunny")
        }
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
