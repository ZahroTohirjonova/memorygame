import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double olcham=100;
  Alignment alignment=Alignment.centerLeft;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              olcham=200;
              alignment=Alignment.centerRight;
            });
          },
      child:Icon(Icons.play_arrow) ,backgroundColor: Colors.blue,),
      body: Center(
        child: AnimatedAlign(

            alignment:alignment==Alignment.centerLeft?Alignment.centerRight:Alignment.centerLeft,

            duration: Duration(seconds: 2),
          onEnd: (){
            setState(() {
              alignment= alignment==Alignment.centerLeft?Alignment.centerRight:Alignment.centerLeft;
            }
            );
          },
          curve: Curves.bounceIn,
        child: AnimatedContainer(



          width: olcham,
            height: olcham,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
            duration: Duration(seconds: 2),
            onEnd: (){setState(() {
        olcham=olcham==200?100:200;
        },

        );
        },
        curve: Curves.bounceOut,),
        ),


      ),
    );
  }
}
