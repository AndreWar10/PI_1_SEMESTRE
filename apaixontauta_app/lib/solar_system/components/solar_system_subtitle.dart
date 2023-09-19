import 'package:apaixontauta_app/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class SolarSystemSubtitle extends StatelessWidget {
  const SolarSystemSubtitle({
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
            'Sistema Solar',
            style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 218, 218, 218),
                fontFamily: AppFonts.poppins500),
          ),
        ],
      ),
    );
  }
}
