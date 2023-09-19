import 'package:apaixontauta_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class MenuAnimatedAstronaut extends StatefulWidget {
  const MenuAnimatedAstronaut({Key? key}) : super(key: key);

  @override
  State<MenuAnimatedAstronaut> createState() => _MenuAnimatedAstronautState();
}

class _MenuAnimatedAstronautState extends State<MenuAnimatedAstronaut> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.2, 0.0),
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeOutQuint),
  );

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: _animation,
          child: Image.asset(
            AppAssets.menuAstronaut,
            width: 190,
            height: 190,
          ),
        ),
      ],
    );
  }
}
