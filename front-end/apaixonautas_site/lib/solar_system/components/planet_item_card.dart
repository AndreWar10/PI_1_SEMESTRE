import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/solar_system/models/solar_system_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlanetItemCard extends StatelessWidget {
  const PlanetItemCard({Key? key, required this.planet}) : super(key: key);

  final SolarSystemModel planet;

  @override
  Widget build(BuildContext context) {
    final String planeta = planet.name;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: () => context.go('/sistemasolar/detalhes/${planeta.toLowerCase()}'),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [planet.baseColor!, planet.baseColor2!],
                      //colors: [Colors.deepOrange, Colors.black],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    //color: planet.baseColor!.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(26)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 75),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                planet.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: AppFonts.poppins700),
                              ),
                            ),
                            Text(
                              '#${planet.id}',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontFamily: AppFonts.poppins700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          children: [
                            Text(
                              planet.resume,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: AppFonts.poppins400),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Saiba mais',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 14,
                                    color: Color.fromARGB(255, 49, 49, 49),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/planets/$planeta.png',
              width: 115,
              height: 115,
            ),
          ],
        ),
      ),
    );
  }
}
