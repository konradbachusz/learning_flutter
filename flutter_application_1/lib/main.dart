import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bmi_screen.dart';
import 'package:flutter_application_1/screens/weather_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
        '/weather': (context) => WeatherScreen(),
      },
      initialRoute: '/',
    );
  }
}
