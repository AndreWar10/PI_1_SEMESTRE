import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatelessWidget {
  final String textButton;
  final String pageTo;
  final String image;

  const MenuButton({
    super.key,
    required this.textButton,
    required this.pageTo,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(pageTo),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          height: 55,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(image),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    textButton,
                    style: TextStyle(
                        fontSize: 15, fontFamily: AppFonts.poppins400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
