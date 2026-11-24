# 🌦️ Realtime Weather App
 
A clean Flutter app that shows **real-time weather** for any city using a live weather API.
 
## ✨ Features
 
- Live weather data from a real weather API
- Current temperature, condition, humidity and wind speed
- Search weather by city name
- Clean and simple UI
- Loading and error handling (no internet, wrong city)
## 🛠️ Tech Stack
 
- **Framework:** Flutter
- **Language:** Dart
- **Data:** REST API (HTTP requests + JSON parsing)
## 🚀 Getting Started
 
### Prerequisites
 
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- An Android device or emulator
- A free API key from your weather provider
### Installation
 
1. Clone the repository
```bash
git clone https://github.com/hamza-hafeez-dev/Realtime-Weather-App.git
cd Realtime-Weather-App
```
 
2. Install dependencies
```bash
flutter pub get
```
 
3. Add your API key (see below)
4. Run the app
```bash
flutter run
```
 
### 🔑 API Key Setup
 
This app needs your own API key. **Never commit your real key to GitHub.**
 
Run the app with the key passed at build time:
 
```bash
flutter run --dart-define=WEATHER_API_KEY=your_key_here
```
 
and read it in Dart:
 
```dart
const apiKey = String.fromEnvironment('WEATHER_API_KEY');
```
 
### 📦 Build Release APK
 
```bash
flutter build apk --release --dart-define=WEATHER_API_KEY=your_key_here
```
 
The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.
 
## 📁 Project Structure
 
```
lib/
├── main.dart
└── ...        # screens, models, services
```
 
## 🔮 Future Improvements
 
- 5-day forecast
- Use current location (GPS)
- Dark mode
- Save favorite cities
## 👨‍💻 Author
 
**Muhammad Hamza Hafeez**
Flutter Developer
 
- GitHub: [@hamza-hafeez-dev](https://github.com/hamza-hafeez-dev)
- LinkedIn: add your profile link here
---
 
⭐ If you like this project, give it a star!
