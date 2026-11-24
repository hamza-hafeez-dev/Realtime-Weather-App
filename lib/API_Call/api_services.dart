import 'dart:convert';
import 'package:http/http.dart' as http;

extension StatusCheck on http.Response {
  bool isSuccess() => statusCode >= 200 && statusCode < 300;
}

abstract class ApiServices {

  static const String baseUrl =
      'https://api.weatherapi.com/v1';

  static const String apiKey = '15e424c7b13c46d8b15173626261111';

  String get apiUrl;

  Future<Map<String, dynamic>> fetchData({
    String cityName = '',
  }) async {

    final uri = Uri.parse('$baseUrl/$apiUrl').replace(
      queryParameters: {
        'key': apiKey,
        'q': cityName,
        'days': '7',
      },
    );

    final response = await http.get(uri);

    if (response.isSuccess()) {

      return jsonDecode(response.body)
          as Map<String, dynamic>;

    } else {

      throw Exception('Data Not Found, Try Again');
    }
  }
}
