import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/solar_system/models/solar_system_model.dart';
import 'package:flutter/material.dart';

class PlanetItemCardWeb extends StatefulWidget {
  const PlanetItemCardWeb({Key? key, required this.planet, required this.index})
      : super(key: key);

  final SolarSystemModel planet;
  final int index;

  @override
  State<PlanetItemCardWeb> createState() => _PlanetItemCardWebState();
}

class _PlanetItemCardWebState extends State<PlanetItemCardWeb> {
  bool isHovered = false;
  double _size = 100.0;

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
        _size = isHovered ? 150.0 : 100.0;
      });

  @override
  Widget build(BuildContext context) {
    final String planeta = widget.planet.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (h) {
            onEntered(true);
          },
          onExit: (e) {
            onEntered(false);
          },
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/detail', arguments: widget.planet);
            },
            child: Padding(
              padding: EdgeInsets.only(left: widget.index != 0 ? 32 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: _size,
                    width: _size,
                    //transform: transform,
                    child: Image.asset('assets/planets/$planeta.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: widget.index != 0 ? 32 : 0),
          child: Text(
            widget.planet.name,
            style:
                TextStyle(color: Colors.white, fontFamily: AppFonts.poppins500),
          ),
        )
      ],
    );
  }
}
