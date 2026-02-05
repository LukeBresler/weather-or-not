# Weather Or Not

A Swift weather app built with SOLID principles and MVVM architecture.

## Overview

Originally built for a technical assessment, this project has been refactored to demonstrate clean architecture and iOS best practices. The app provides location-based weather information with city search functionality.

## Features

- Current weather data by city
- Location-based weather updates
- City search with results
- Error handling and loading states
- Basic offline caching

## Architecture

The app uses MVVM to separate UI from business logic, making the code easier to test and maintain.

### SOLID Principles

The refactor focused on implementing SOLID design:

- **Single Responsibility** - Each class has one clear purpose
- **Open/Closed** - Easy to extend without modifying existing code
- **Liskov Substitution** - Protocol-based design for swappable components
- **Interface Segregation** - Small, focused protocols
- **Dependency Inversion** - Dependencies are injected, not hardcoded

## Tech Stack

- Swift 5.x
- UIKit
- MVVM architecture
- URLSession for networking
- CoreLocation for location services
- UserDefaults for caching

## Project Structure

```
Weather Or Not/
├── Models/               # Weather and location data models
├── ViewModels/           # Business logic layer
├── Views/                # UI components and view controllers
├── Services/             # Weather API, location, and caching
├── Networking/           # API client and error handling
├── Utilities/            # Extensions and constants
└── Resources/            # Assets and configuration
```

## Getting Started

### Requirements

- Xcode 14.0+
- iOS 15.0+
- Weather API key (OpenWeatherMap or WeatherAPI)

### Setup

1. Clone the repo
   ```bash
   git clone https://github.com/LukeBresler/weather-or-not.git
   ```

2. Open the project
   ```bash
   open "Weather Or Not.xcodeproj"
   ```

3. Add your API key
   
   Update the config file with your API key:
   ```swift
   enum Config {
       static let weatherAPIKey = "YOUR_API_KEY_HERE"
       static let baseURL = "https://api.weatherapi.com/v1"
   }
   ```

4. Build and run (Cmd + R)

Get a free API key from [OpenWeatherMap](https://openweathermap.org/api) or [WeatherAPI](https://www.weatherapi.com/).

## Testing

Unit tests cover:
- ViewModel logic
- API client and network handling
- Location and caching services
- Mock objects for isolated testing

Run tests with `Cmd + U` or:
```bash
xcodebuild test -scheme "Weather Or Not" -destination 'platform=iOS Simulator,name=iPhone 15'
```

## Future Improvements

- 7-day forecast
- Hourly breakdowns
- Weather alerts
- Multiple saved locations
- Widget support
- Dark mode
- Localization

## Contributing

Suggestions welcome. Fork the repo, make your changes, and submit a PR.

## License

MIT License

## Author

Luke Bresler - [@LukeBresler](https://github.com/LukeBresler)
