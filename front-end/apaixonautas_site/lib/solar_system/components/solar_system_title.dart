import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class SolarSystemTitle extends StatelessWidget {
  const SolarSystemTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explorar',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: AppFonts.poppins700),
          ),
        ],
      ),
    );
  }
}
