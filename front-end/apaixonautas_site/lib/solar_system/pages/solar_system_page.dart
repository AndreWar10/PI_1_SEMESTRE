import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/solar_system/components/planet_item_card.dart';
import 'package:apaixonautas_site/solar_system/components/solar_system_subtitle.dart';
import 'package:apaixonautas_site/solar_system/components/solar_system_title.dart';
import 'package:apaixonautas_site/solar_system/models/solar_system_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SolarSystemPage extends StatefulWidget {
  const SolarSystemPage({super.key, required this.listPlanets});

  final List<SolarSystemModel> listPlanets;

  @override
  State<SolarSystemPage> createState() => _SolarSystemPageState();
}

class _SolarSystemPageState extends State<SolarSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AlignedGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  itemCount: widget.listPlanets.length,
                  itemBuilder: (context, index) =>
                      PlanetItemCard(planet: widget.listPlanets[index])),
            ),
          ],
        ),
      ),
    ));
  }
}
