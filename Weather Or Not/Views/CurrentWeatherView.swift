//
//  CurrentWeatherView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//
import SwiftUI

struct CurrentWeatherView: View {
    
    var body: some View {
        VStack(spacing: 20) {
           Spacer()
            Text("25°")
                .font(.system(size: 86))
                .foregroundColor(.white)
                .padding(.bottom, -10)
             Text("Clear")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.medium)
            Spacer()
        }
    }
}
