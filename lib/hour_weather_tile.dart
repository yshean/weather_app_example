import 'package:flutter/material.dart';
import 'package:weather_app_new/utils.dart';

import 'constants.dart';
import 'models/hour_weather.dart';

class HourWeatherTile extends StatelessWidget {
  final HourWeather hourWeather;

  const HourWeatherTile({
    super.key,
    required this.hourWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        gradient: tileGradient,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
        border: Border.all(
          width: 1.0,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hourWeather.hour,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          Image.asset(getWeatherIconPath(hourWeather.weatherType)),
          Text(
            hourWeather.weatherDescription,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${hourWeather.temperature}°',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
