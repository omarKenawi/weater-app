import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseURL = 'http://api.weatherapi.com/v1';
  String key = '3a03690a47594863a02203050232201';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse("$baseURL/forecast.json?key=$key&q=$cityName&days=1");
    http.Response response = await http.get(url);
    dynamic data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
