import 'package:weather_ui/API_Call/api_services.dart';
import 'package:weather_ui/API_Call/modelclass.dart';

class WeatherAPIService extends ApiServices {
  @override
  String get apiUrl => 'forecast.json';

  Future<WeatherModelclass> getData(String city) async {
    final Map<String, dynamic> data = await fetchData(cityName: city);

    return WeatherModelclass.fromApi(data);
  }
}
