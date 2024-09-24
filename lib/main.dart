import 'package:flutter/material.dart';

import 'routing.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      onGenerateRoute: Routing.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
