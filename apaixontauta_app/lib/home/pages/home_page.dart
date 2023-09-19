import 'package:apaixontauta_app/core/app_assets.dart';
import 'package:apaixontauta_app/core/app_fonts.dart';
import 'package:apaixontauta_app/home/components/menu_animated_astronaut.dart';
import 'package:apaixontauta_app/home/components/menu_item_button.dart';
import 'package:apaixontauta_app/solar_system/pages/solar_system_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundMax),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MenuAnimatedAstronaut(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      //'Olá ${user.displayName}',
                      'Olá Andre',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: AppFonts.poppins700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'por onde vamos começar?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: AppFonts.poppins400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                MenuButton(
                  textButton: 'sistema solar',
                  pageTo: const SolarSystemContainer(),
                  image: AppAssets.menuSolarSystem,
                ),
                const SizedBox(height: 16),
                MenuButton(
                  textButton: 'notícias',
                  pageTo: Container(),
                  image: AppAssets.menuNews,
                ),
                const SizedBox(height: 16),
                MenuButton(
                  textButton: 'lançamentos',
                  pageTo: Container(),
                  image: AppAssets.menuLaunchs,
                ),
                const SizedBox(height: 16),
                MenuButton(
                  textButton: 'observatórios',
                  pageTo: Container(),
                  image: AppAssets.menuObservatories,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
