import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExplicitBall extends StatefulWidget {
  @override
  State<CustomExplicitBall> createState() => _CustomExplicitBallState();
}

class _CustomExplicitBallState extends State<CustomExplicitBall>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double y = 200 * Curves.bounceOut.transform(controller.value);
          return Transform.translate(
            offset: Offset(0, y),
            child: child,
          );
        },
        child: Icon(Icons.sports_soccer, size: 80),
      ),
    );
  }
}
