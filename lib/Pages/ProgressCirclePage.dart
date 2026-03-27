import 'dart:math';

import 'package:flutter/material.dart';

class ProgressCirclePage extends StatefulWidget {
  final double progress;
  const ProgressCirclePage({super.key, required this.progress});


  @override
  State<ProgressCirclePage> createState() => _ProgressCirclePageState();
}

class _ProgressCirclePageState extends State<ProgressCirclePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          foregroundPainter: ProgressPainter(widget.progress),
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: Text("${(widget.progress*100).round()}%",
            style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),

          ),
        )
      ),
    );
  }
}
class ProgressPainter extends CustomPainter{
  final double progress;
  ProgressPainter(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    var strokeWidth=12.0;
    final rect=Offset.zero&size;
    final center = size.center(Offset.zero);
    final radius = min(size.width/2,size.height/2)-strokeWidth;

    final BAckgroundPaint=Paint()
    ..color=Colors.grey[800]!
    ..style=PaintingStyle.stroke
    ..strokeWidth=strokeWidth;

    final progressPaint=Paint()
    ..shader=SweepGradient(
        colors: [Colors.green,Colors.blue],
    startAngle: 0.0,
    endAngle: 2*pi*progress,
    ).createShader(rect)
    ..style=PaintingStyle.stroke
    ..strokeCap=StrokeCap.round;
    strokeWidth=strokeWidth;

    canvas.drawCircle(center, radius, BAckgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // start from top
      2 * pi * progress, // progress angle
      false,
      progressPaint,
    );

  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {

    return oldDelegate.progress != progress;
  }

}

