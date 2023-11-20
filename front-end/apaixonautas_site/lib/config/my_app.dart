import 'package:apaixonautas_site/home/pages/home_page.dart';
import 'package:apaixonautas_site/news/pages/news_container.dart';
import 'package:apaixonautas_site/solar_system/controllers/solar_system_controller.dart';
import 'package:apaixonautas_site/solar_system/models/solar_system_model.dart';
import 'package:apaixonautas_site/solar_system/pages/detail_planet_page.dart';
import 'package:apaixonautas_site/solar_system/pages/solar_system_container.dart';
import 'package:apaixonautas_site/user/forget_network/pages/forget_network_container.dart';
import 'package:apaixonautas_site/user/login/pages/login_container.dart';
import 'package:apaixonautas_site/user/sign_up/pages/sign_up_container.dart';
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return const TextStyle(decoration: TextDecoration.underline);
              }
              return const TextStyle(decoration: TextDecoration.none);
              }
            ),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(
              builder: (_) => const HomePage(),
              settings: const RouteSettings(name: '/home'),
            );
          case '/systemsolar':
            return MaterialPageRoute(
              builder: (_) => const SolarSystemContainer(),
              settings: const RouteSettings(name: '/systemsolar'),
            );
          case '/detail':
            return MaterialPageRoute(
              builder: (_) => PlanetDetailPage(
              planet: settings.arguments as SolarSystemModel),
              settings: RouteSettings(
                name:'/systemsolar/${SolarSystemController().returnId(settings.arguments as SolarSystemModel)}',
              ),
            );
          case '/news':
            return MaterialPageRoute(
              builder: (_) => const NewsContainer(),
              settings: const RouteSettings(name: '/news'),
            );
          case '/login':
            return MaterialPageRoute(
              builder: (_) => const LoginPageContainer(),
              settings: const RouteSettings(name: '/login'),
            );
          case '/recover-pass':
            return MaterialPageRoute(
              builder: (_) => const ForgetNetworkContainer(),
              settings: const RouteSettings(name: '/recover-pass'),
            );
          case '/sign-up':
            return MaterialPageRoute(
              builder: (_) => const SignUpContainer(),
              settings: const RouteSettings(name: '/sign-up'),
            );

          default:
            return MaterialPageRoute(
              builder: (_) => const HomePage(),
              settings: const RouteSettings(name: '/home'),
            );
        }
      },
    );
  }
}
