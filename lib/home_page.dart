import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_new/action_button.dart';
import 'package:weather_app_new/models/city_weather.dart';
import 'package:weather_app_new/utils.dart';

import 'circle_tab_indicator.dart';
import 'hour_weather_tile.dart';
import 'models/enums.dart';
import 'models/hour_weather.dart';
import 'routing.dart';

enum MenuOption { manageCity }

class HomePage extends StatelessWidget {
  final ValueChanged<String>? onTapped;
  final LinearGradient backgroundGradient;
  final CityWeather? cityWeather;

  const HomePage({
    super.key,
    this.onTapped,
    required this.backgroundGradient,
    this.cityWeather,
  });

  PageRoute get route => MaterialPageRoute(
        builder: (context) => HomePage(
          backgroundGradient: backgroundGradient,
          cityWeather: cityWeather,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: cityWeather == null
          ? Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'Get started'.toUpperCase(),
                  style: const TextStyle(
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case MenuOption.manageCity:
                          Navigator.of(context).pushNamed(Routes.manageCity);
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: MenuOption.manageCity,
                        child: Text('Manage City'),
                      ),
                    ],
                  )
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select a city in Manage City to view the weather',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12.0),
                  ActionButton(
                    label: 'Manage City',
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.manageCity);
                    },
                  ),
                ],
              ),
            )
          : Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  cityWeather!.cityName.toUpperCase(),
                  style: const TextStyle(
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case MenuOption.manageCity:
                          Navigator.of(context).pushNamed(Routes.manageCity);
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: MenuOption.manageCity,
                        child: Text('Manage City'),
                      ),
                    ],
                  )
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cityWeather!.weatherDescription,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 24.0,
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                DateFormat('EEEE, d MMMM')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${cityWeather!.temperature}°',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 72.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80.0),
                    DefaultTabController(
                      length: 2,
                      child: Expanded(
                        child: Column(
                          children: [
                            TabBar(
                              tabAlignment: TabAlignment.start,
                              isScrollable: true,
                              indicator: CircleTabIndicator(
                                color: Colors.cyan,
                                radius: 6.0,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor:
                                  Colors.white.withOpacity(0.5),
                              dividerColor: Colors.transparent,
                              tabs: const [
                                Tab(
                                  icon: Text(
                                    'Today',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Tab(
                                  icon: Text(
                                    'Tomorrow',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            SizedBox(
                              height: 200,
                              child: TabBarView(
                                children: [
                                  FutureBuilder<List<HourWeather>>(
                                    future: Future<List<HourWeather>>.delayed(
                                      const Duration(seconds: 3),
                                      () => [
                                        const HourWeather(
                                          hour: '01:00',
                                          temperature: 34,
                                          weatherDescription: 'Mostly Sunny',
                                          weatherType: WeatherType.sunny,
                                        ),
                                        const HourWeather(
                                          hour: '02:00',
                                          temperature: 28,
                                          weatherDescription: 'Partly Cloudy',
                                          weatherType: WeatherType.cloudy,
                                        ),
                                        const HourWeather(
                                          hour: '03:00',
                                          temperature: 26,
                                          weatherDescription: 'Foggy',
                                          weatherType:
                                              WeatherType.sunnyWithCloud,
                                        ),
                                        const HourWeather(
                                          hour: '04:00',
                                          temperature: 32,
                                          weatherDescription: 'Mostly Sunny',
                                          weatherType: WeatherType.sunny,
                                        ),
                                      ],
                                    ),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasData) {
                                        return SizedBox(
                                          height: 200,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (_, index) =>
                                                HourWeatherTile(
                                              hourWeather:
                                                  snapshot.data![index],
                                            ),
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(width: 12.0),
                                            itemCount:
                                                snapshot.data?.length ?? 0,
                                          ),
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                  const StreamWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class StreamWidget extends StatefulWidget {
  const StreamWidget({super.key});

  @override
  State<StreamWidget> createState() => _StreamWidgetState();
}

class _StreamWidgetState extends State<StreamWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<List<HourWeather>>(
      stream: getHourlyWeathers(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => HourWeatherTile(
                hourWeather: snapshot.data![index],
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 12.0),
              itemCount: snapshot.data?.length ?? 0,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
