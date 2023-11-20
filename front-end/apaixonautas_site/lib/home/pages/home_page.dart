import 'package:apaixonautas_site/core/components/custom_web_menu.dart';
import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/core/utils/app_routes.dart';
import 'package:apaixonautas_site/home/components/menu_animated_astronaut.dart';
import 'package:apaixonautas_site/home/components/menu_item_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuWebCustom(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundMax),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
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
                pageTo: AppRoutes.systemSolar,
                image: AppAssets.menuSolarSystem,
              ),
              const SizedBox(height: 16),
              MenuButton(
                textButton: 'notícias',
                pageTo: AppRoutes.news,
                image: AppAssets.menuNews,
              ),
              const SizedBox(height: 16),
              MenuButton(
                textButton: 'lançamentos',
                pageTo: '',
                image: AppAssets.menuLaunchs,
              ),
              const SizedBox(height: 16),
              MenuButton(
                textButton: 'observatórios',
                pageTo: '',
                image: AppAssets.menuObservatories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

