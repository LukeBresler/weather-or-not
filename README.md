# WeatherApp

A clean, modular weather app built for a tech assessment. Originally a basic MVP, it has since been refactored to align with **SOLID principles** for better scalability, testability, and maintainability.

## ✨ Features

- Current weather data by city
- Search functionality
- Location-based weather (if permissions granted)
- Clean and responsive UI
- Error handling and loading states

## 🛠️ Tech Stack

- **Language**: Swift
- **Architecture**: MVVM
- **Networking**: URLSession / Custom APIClient
- **UI**: UIKit / SwiftUI (update if relevant)
- **Other**: CoreLocation, UserDefaults

## ✅ SOLID Refactor Overview

The app was recently refactored with a strong emphasis on SOLID design principles:

- **S**: Single Responsibility Principle  
  Each class/component has one clearly defined responsibility.
  
- **O**: Open/Closed Principle  
  New features or behaviour can be added with minimal changes to existing code.
  
- **L**: Liskov Substitution Principle  
  Protocol-based design ensures interchangeable components.
  
- **I**: Interface Segregation Principle  
  Protocols are split into focused, smaller contracts.
  
- **D**: Dependency Inversion Principle  
  High-level modules do not depend on low-level ones—both depend on abstractions.

## 📁 Project Structure

WeatherApp/
│
├── Models/            # Data models
├── ViewModels/        # Business logic and binding
├── Views/             # UI components
├── Networking/        # API client, endpoints
├── Services/          # Location, persistence, etc.
├── Utilities/         # Helpers and extensions
└── Resources/         # Assets, colors, strings

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/weatherapp.git

	2.	Open in Xcode:

open WeatherApp.xcodeproj


	3.	Run on a simulator or device.
	4.	To use live weather data, insert your API key in the appropriate config file:

let apiKey = "YOUR_API_KEY"



🧪 Testing

Includes unit tests for core components (API client, ViewModels).
Designed for easy mocking and extension.

📌 Notes
	•	Built as part of a tech assessment.
	•	Refactored independently to demonstrate proficiency in clean architecture and SOLID principles.

📜 License

MIT

---

Let me know if you’d like a version that’s more playful, minimal, or business-formal—or if you want to auto-generate badges or link a live demo.
