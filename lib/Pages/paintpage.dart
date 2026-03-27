import 'package:flutter/material.dart';

class paintpage extends StatefulWidget {
  const paintpage({super.key});

  @override
  State<paintpage> createState() => _paintpageState();
}

class _paintpageState extends State<paintpage> {
  double chap=215;
  double balandlik=107;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              chap=2000;
              balandlik=107;
            });
          },
      child: Icon(Icons.local_fire_department_sharp,color: Colors.orange,),),

      body:
          Stack(
            children: [Column(
              children:[
                SizedBox(
                  height: 100,
                ),
                CustomPaint(
              size: Size(2000, 300),
              painter: MyPainter(),
                      )],
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 2),

              top: balandlik,
                left: chap,
                child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                ),

                ))]
          ),


    );
  }
}
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth=4;
    paint.style=PaintingStyle.stroke;

    canvas.drawCircle(Offset(100, -27), 30, paint);
    canvas.drawLine(Offset(100, 3), Offset(100, 100), paint);
    canvas.drawLine(Offset(100, 97), Offset(50, 200), paint);
    canvas.drawLine(Offset(100, 97), Offset(150, 200), paint);
    canvas.drawLine(Offset(100, 20), Offset(50, 100), paint);
    canvas.drawLine(Offset(100, 20), Offset(190, 20), paint);
    canvas.drawLine(Offset(190, 10), Offset(180, 30), paint);
    canvas.drawLine(Offset(190, 13), Offset(214, 12), paint);



  }

  @override
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }


}
