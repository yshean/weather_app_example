import 'package:flutter/material.dart';
import 'package:weather_app_new/city_weather_tile.dart';
import 'package:weather_app_new/models/city_weather.dart';
import 'package:weather_app_new/models/enums.dart';
import 'package:weather_app_new/routing.dart';

import 'action_button.dart';
import 'constants.dart';

class ManageCityPage extends StatefulWidget {
  const ManageCityPage({super.key});

  static PageRoute get route =>
      MaterialPageRoute(builder: (context) => const ManageCityPage());

  @override
  ManageCityPageState createState() => ManageCityPageState();
}

class ManageCityPageState extends State<ManageCityPage> {
  List<CityWeather> cityWeathers = [
    const CityWeather(
      cityName: 'Kuala Lumpur',
      temperature: 32,
      weatherType: WeatherType.cloudy,
      weatherDescription: 'Partly cloudy',
    ),
    const CityWeather(
      cityName: 'Putrajaya',
      temperature: 34,
      weatherType: WeatherType.sunny,
      weatherDescription: 'Mostly Sunny',
    ),
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: const BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Manage City',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) => CityWeatherTile(
                  cityWeather: cityWeathers[index],
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home,
                      (route) => route.settings.name == Routes.home,
                      arguments: {'cityWeather': cityWeathers[index]},
                    );
                  },
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                itemCount: cityWeathers.length,
              ),
            ),
            ActionButton(
              label: 'Add city',
              onPressed: () async {
                final CityWeather? result = await showDialog(
                  context: context,
                  builder: (_) => Form(
                    key: _formKey,
                    child: AlertDialog(
                      title: const Text('Enter a city name'),
                      content: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Cyberjaya",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cannot be empty';
                          }
                          return null;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(
                                context,
                                const CityWeather(
                                  cityName: 'Cyberjaya',
                                  temperature: 32,
                                  weatherType: WeatherType.sunnyWithCloud,
                                  weatherDescription: 'Foggy',
                                ),
                              );
                            }
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                );
                if (result is CityWeather) {
                  setState(() {
                    cityWeathers.add(result);
                  });
                }
              },
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
