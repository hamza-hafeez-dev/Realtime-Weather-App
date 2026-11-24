import 'dart:convert';

class WeatherModelclass {
  String? cityName;
  String? countryName;
  double? tempC;
  String? conditionText;
  double? windKph;
  int? humidity;
  String? sunrise;
  String? currentIconUrl;

  List<ForecastDayModel> forecastDays;

  WeatherModelclass({
    this.cityName,
    this.countryName,
    this.tempC,
    this.conditionText,
    this.windKph,
    this.humidity,
    this.sunrise,
    this.currentIconUrl,
    this.forecastDays = const [],
  });

  factory WeatherModelclass.fromJson(String source) {
    return WeatherModelclass.fromApi(
      jsonDecode(source) as Map<String, dynamic>,
    );
  }

  factory WeatherModelclass.fromApi(Map<String, dynamic> json) {
    final forecastList =
        json['forecast']?['forecastday'] as List<dynamic>? ?? [];

    return WeatherModelclass(
      cityName: json['location']?['name'],
      countryName: json['location']?['country'],
      tempC: (json['current']?['temp_c'] as num?)?.toDouble(),
      conditionText: json['current']?['condition']?['text'],
      windKph: (json['current']?['wind_kph'] as num?)?.toDouble(),
      humidity: json['current']?['humidity'],
      sunrise: json['forecast']?['forecastday']?[0]?['astro']?['sunrise'],
      currentIconUrl: json['current']?['condition']?['icon'] == null
          ? null
          : 'https:${json['current']['condition']['icon']}',

      // Convert API forecast list into our Dart model list
      forecastDays: forecastList.map((item) {
        return ForecastDayModel.fromJson(Map<String, dynamic>.from(item));
      }).toList(),
    );
  }
}

class ForecastDayModel {
  final String date;
  final double temperature;
  final String iconUrl;

  ForecastDayModel({
    required this.date,
    required this.temperature,
    required this.iconUrl,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    final icon = json['day']?['condition']?['icon'] ?? '';

    return ForecastDayModel(
      date: json['date'] ?? '',
      temperature: (json['day']?['avgtemp_c'] as num?)?.toDouble() ?? 0.0,
      iconUrl: icon.toString().startsWith('//') ? 'https:$icon' : icon,
    );
  }
}
