import 'package:apaixontauta_app/home/pages/home_page.dart';
import 'package:apaixontauta_app/solar_system/models/solar_system_model.dart';
import 'package:apaixontauta_app/solar_system/pages/detail_planet_page.dart';
import 'package:apaixontauta_app/solar_system/pages/solar_system_container.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const HomePage(), settings: const RouteSettings(name: '/home'));
          case '/systemsolar':
            return MaterialPageRoute(builder: (_) => const SolarSystemContainer(), settings: const RouteSettings(name: '/systemsolar'));
          case '/detail':
            return MaterialPageRoute(builder: (_) => PlanetDetailPage(planet: settings.arguments as SolarSystemModel), settings: const RouteSettings(name: '/systemsolar/detail'));
          default:
          return MaterialPageRoute(builder: (_) => const HomePage(), settings: const RouteSettings(name: '/home'));
        }
      },
    );
  }
}
