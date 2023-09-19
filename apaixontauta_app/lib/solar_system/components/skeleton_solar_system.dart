import 'package:apaixontauta_app/core/components/skeleton.dart';
import 'package:apaixontauta_app/solar_system/components/solar_system_subtitle.dart';
import 'package:apaixontauta_app/solar_system/components/solar_system_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SkeletonSolarSystem extends StatelessWidget {
  const SkeletonSolarSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const SolarSystemTitle(),
        const SizedBox(height: 5),
        const SolarSystemSubtitle(),
        const SizedBox(height: 40),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(top: 16, bottom: 20, left: 8, right: 8),
            child: AlignedGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(2),
                  child: Skeleton(
                    height: 250,
                    width: double.maxFinite,
                    borderRadius: BorderRadius.circular(26),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
