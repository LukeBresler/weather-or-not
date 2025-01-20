//
//  WeatherView.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/01/20.
//

import SwiftUI

struct WeatherView: View {
    
    var body: some View {
        ZStack {
            // Base background
            Color("clear")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("sea_sunny")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 300)
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                Spacer()
            }
            
            ZStack {
                VStack {
                    VStack {
                        CurrentWeatherView()
                    }
                    .padding(.bottom)
                    
                    VStack {
                        TemperatureRangeView()
                    }
                    Spacer()
                    Divider()
                        .background(Color.white)
                        .padding(.horizontal)
                    
                    // Forecast list
                    ScrollView {
                        HStack {
                            Text("Monday")
                            Spacer()
                            Image("clear")
                            Spacer()
                            Text("21°C")
                        }
                        HStack {
                            Text("Tuesday")
                            Spacer()
                            Image("partlysunny")
                            Spacer()
                            Text("18°C")
                        }
                        HStack {
                            Text("Wednesday")
                            Spacer()
                            Image("partlysunny")
                            Spacer()
                            Text("16°C")
                        }
                        HStack {
                            Text("Thursday")
                            Spacer()
                            Image("rain")
                            Spacer()
                            Text("14°C")
                        }
                        HStack {
                            Text("Friday")
                            Spacer()
                            Image("clear")
                            Spacer()
                            Text("19°C")
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                }
            }
        }
    }
    
    
}
