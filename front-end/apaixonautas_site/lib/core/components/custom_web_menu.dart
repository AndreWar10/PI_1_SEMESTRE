import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class MenuWebCustom extends PreferredSize {
  const MenuWebCustom({super.key})
      : super(
            child: const SizedBox(), preferredSize: const Size.fromHeight(100));

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: Container(
        height: 80,
        color: const Color.fromARGB(255, 27, 27, 27),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.person, color: Colors.white, size: 38),
              const SizedBox(width: 6),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Text(
                      'Entre ou ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.poppins400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/sign-up');
                      },
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.poppins700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
