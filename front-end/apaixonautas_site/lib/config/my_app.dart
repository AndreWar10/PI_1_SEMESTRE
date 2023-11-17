import 'package:apaixonautas_site/home/pages/home_page.dart';
import 'package:apaixonautas_site/news/pages/news_container.dart';
import 'package:apaixonautas_site/solar_system/controllers/solar_system_controller.dart';
import 'package:apaixonautas_site/solar_system/models/solar_system_model.dart';
import 'package:apaixonautas_site/solar_system/pages/detail_planet_page.dart';
import 'package:apaixonautas_site/solar_system/pages/solar_system_container.dart';
import 'package:apaixonautas_site/user/login/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apaixonauta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(
                builder: (_) => const HomePage(),
                settings: const RouteSettings(name: '/home'));
          case '/systemsolar':
            return MaterialPageRoute(
                builder: (_) => const SolarSystemContainer(),
                settings: const RouteSettings(name: '/systemsolar'));
          case '/detail':
            return MaterialPageRoute(
                builder: (_) => PlanetDetailPage(
                    planet: settings.arguments as SolarSystemModel),
                settings: RouteSettings(
                    name:
                        '/systemsolar/${SolarSystemController().returnId(settings.arguments as SolarSystemModel)}'));
          case '/news':
            return MaterialPageRoute(
                builder: (_) => const NewsContainer(),
                settings: const RouteSettings(name: '/news'));
          case '/login':
            return MaterialPageRoute(
                builder: (_) => const LoginPage(),
                settings: const RouteSettings(name: '/login'));
          default:
            return MaterialPageRoute(
                builder: (_) => const HomePage(),
                settings: const RouteSettings(name: '/home'));
        }
      },
    );
  }
}
