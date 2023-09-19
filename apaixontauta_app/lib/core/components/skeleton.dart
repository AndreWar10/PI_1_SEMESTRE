import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool foceLight;
  const Skeleton(
      {required this.height,
      required this.width,
      required this.borderRadius,
      this.boxShadow,
      this.foceLight = false,
      super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Color> get colors {
    if (widget.foceLight) {
      return [
        Colors.black12,
        Colors.black26,
        Colors.black12,
      ];
    }

    return [
      const Color(0XFF34353F),
      const Color(0XFF1E1F28),
      const Color(0XFF34353F),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: const Alignment(-1, 0),
          colors: colors,
        ),
      ),
    );
  }
}
