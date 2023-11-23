import 'package:apaixonautas_site/core/models/data_model.dart';
import 'package:apaixonautas_site/home/pages/home_page.dart';
import 'package:apaixonautas_site/news/pages/news_container.dart';
import 'package:apaixonautas_site/solar_system/pages/detail_planet_page.dart';
import 'package:apaixonautas_site/solar_system/pages/solar_system_container.dart';
import 'package:apaixonautas_site/user/forget_network/pages/forget_network_container.dart';
import 'package:apaixonautas_site/user/login/pages/login_container.dart';
import 'package:apaixonautas_site/user/sign_up/pages/sign_up_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    errorBuilder: ((context, state) => const PageNotFound404()),
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/sistemasolar',
        builder: (BuildContext context, GoRouterState state) {
          return const SolarSystemContainer();
        },
      ),
      GoRoute(
        path: '/sistemasolar/detalhes/:planetName',
        builder: (BuildContext context, GoRouterState state) {
          final String nameParam = state.pathParameters['planetName'] ?? '';
          for (String name in Data.planetsNames) {
            if (nameParam.toUpperCase().trim() == name) {
              return PlanetDetailPage(
                planetN: state.pathParameters['planetName'] as String,
              );
            }
          }

          return const PageNotFound404();
        },
      ),
      GoRoute(
        path: '/noticias',
        builder: (BuildContext context, GoRouterState state) {
          return const NewsContainer();
        },
      ),
      GoRoute(
        path: '/lancamentos',
        builder: (BuildContext context, GoRouterState state) {
          return const NewsContainer();
        },
      ),
      GoRoute(
        path: '/observatorios',
        builder: (BuildContext context, GoRouterState state) {
          return const NewsContainer();
        },
      ),
      GoRoute(
        path: '/recuperar-senha',
        builder: (BuildContext context, GoRouterState state) {
          return const ForgetNetworkContainer();
        },
      ),
      GoRoute(
        path: '/cadastro',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpContainer();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPageContainer();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
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
            }),
          ),
        ),
      ),
    );
  }
}

class PageNotFound404 extends StatelessWidget {
  const PageNotFound404({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This my custom errorpage',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
