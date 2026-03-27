import 'dart:math';
import 'package:flutter/material.dart';

class homemmrypage extends StatefulWidget {

  final String imagePath;
  final bool isOpen;
  final VoidCallback onTap;

  const homemmrypage({
    super.key,
    required this.imagePath,
    required this.isOpen,
    required this.onTap,
  });

  @override
  State<homemmrypage> createState() => _homemmrypageState();
}

class _homemmrypageState extends State<homemmrypage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didUpdateWidget(covariant homemmrypage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget oldTomon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget orqaTomon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        widget.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // ✅ FAOLIYAT PARENTGA O‘TDI
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * pi;
          final isUnder = angle > pi / 2;

          return SizedBox(
            width: 100,
            height: 100,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: isUnder
                  ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(pi),
                child: orqaTomon(),
              )
                  : oldTomon(),
            ),
          );
        },
      ),
    );
  }
}
