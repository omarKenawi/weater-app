import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weathermodel;

  WeatherModel? get weathermodel => _weathermodel;

  set weathermodel(WeatherModel? value) {
    _weathermodel = value;
    notifyListeners();

  }
}