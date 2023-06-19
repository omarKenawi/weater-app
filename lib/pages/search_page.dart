import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
        // backgroundColor: CupertinoColors.systemOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: TextField(
          onSubmitted: (String value) async {
            if (value != "") {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel weather= await service.getWeather(cityName: cityName);
              Provider.of<WeatherProvider>(context,listen: false).weathermodel=weather;
              Navigator.pop(context);

            }
          },
          decoration: const InputDecoration(
            hintText: "Enter the city",
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(),
            label: Text("search"),
          ),
        ),
      ),
    );
  }
}
