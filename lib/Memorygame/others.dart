import 'package:flutter/material.dart';

class others extends StatefulWidget {
  const others({super.key});

  @override
  State<others> createState() => _othersState();
}

class _othersState extends State<others> {
  bool isBig = false;
  void _startPulse() {

    setState(() {
      isBig = !isBig;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children: [GestureDetector(
            onTap: () {
              setState(() {
                isBig = !isBig;
              });
            },
            child: Center(
              child: AnimatedScale(
                onEnd: _startPulse,
                scale: isBig ? 1.3 : 1.0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Icon(Icons.favorite, color: Colors.red, size: 100),
              ),
            ),
      
          ),
          Positioned(
            left: 0,
              top: 200,
              child: IconButton(onPressed: (){setState(() {
            Navigator.pop(context);
          });}, icon: Icon(Icons.arrow_circle_left_outlined,color: Colors.indigo,size: 40,))),
            Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset("assets/images/img.png",width: 200,height: 200,fit: BoxFit.cover,)),]
        ),
      );

  }
}

