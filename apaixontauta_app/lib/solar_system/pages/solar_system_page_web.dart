import 'package:apaixontauta_app/core/utils/app_assets.dart';
import 'package:apaixontauta_app/solar_system/components/planet_item_card_web.dart';
import 'package:apaixontauta_app/solar_system/components/solar_system_subtitle.dart';
import 'package:apaixontauta_app/solar_system/components/solar_system_title.dart';
import 'package:apaixontauta_app/solar_system/models/solar_system_model.dart';
import 'package:flutter/material.dart';

class SolarSystemPageWeb extends StatelessWidget {
  const SolarSystemPageWeb({super.key, required this.listPlanets});
  final List<SolarSystemModel> listPlanets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundMiddle),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SolarSystemTitle(),
            const SizedBox(height: 5),
            const SolarSystemSubtitle(),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: listPlanets.length,
                itemBuilder: (context, index) {
                  return PlanetItemCardWeb(
                    index: index,
                    planet: listPlanets[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
