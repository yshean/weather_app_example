import 'dart:math';

import 'package:weather_app_new/models/hour_weather.dart';

import 'images.dart';
import 'models/enums.dart';

String getWeatherIconPath(WeatherType weatherType) {
  switch (weatherType) {
    case WeatherType.sunny:
      return Images.sun;
    case WeatherType.sunnyWithCloud:
      return Images.sunWithCloud;
    case WeatherType.cloudy:
      return Images.cloud;
    default:
      throw Exception('Unknown WeatherType: $weatherType');
  }
}

Stream<T> streamDelayer<T>(Stream<T> inputStream, Duration delay) async* {
  await for (final val in inputStream) {
    yield val;
    await Future.delayed(delay);
  }
}

Future<List<HourWeather>> getLatestHourlyWeathers() async {
  await Future.delayed(const Duration(seconds: 2));
  return [
    HourWeather(
      hour: '12:00 PM',
      temperature: (20 + (Random.secure().nextInt(10) * 5 / 10)).toInt(),
      weatherType: WeatherType.sunny,
      weatherDescription: 'Sunny',
    ),
    HourWeather(
      hour: '1:00 PM',
      temperature: (20 + (Random.secure().nextInt(10) * 5 / 10)).toInt(),
      weatherType: WeatherType.sunnyWithCloud,
      weatherDescription: 'Partly Cloudy',
    ),
    HourWeather(
      hour: '2:00 PM',
      temperature: (20 + (Random.secure().nextInt(10) * 5 / 10)).toInt(),
      weatherType: WeatherType.cloudy,
      weatherDescription: 'Cloudy',
    ),
    HourWeather(
      hour: '3:00 PM',
      temperature: (20 + (Random.secure().nextInt(10) * 5 / 10)).toInt(),
      weatherType: WeatherType.sunny,
      weatherDescription: 'Sunny',
    ),
    HourWeather(
      hour: '4:00 PM',
      temperature: (20 + (Random.secure().nextInt(10) * 5 / 10)).toInt(),
      weatherType: WeatherType.sunnyWithCloud,
      weatherDescription: 'Partly Cloudy',
    ),
  ];
}

Stream<List<HourWeather>> getHourlyWeathers() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    yield await getLatestHourlyWeathers();
  }
}
