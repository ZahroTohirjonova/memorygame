import 'package:animation/Memorygame/GamePage.dart';
import 'package:animation/Memorygame/MultiplayerPage.dart';
import 'package:flutter/material.dart';

class SelectType extends StatelessWidget {

  const SelectType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [


            Positioned(
              left: 30,
                right: 30,
                top:0,
                child: Column(children: [
                  Text("Select type:",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.indigo),),
                SizedBox(height: 25,),
                  Row(
                    children: [
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white),onPressed: (){
                            Navigator.push((context), MaterialPageRoute(builder: (context)=>GamePage(eni: 2, boyi: 3)));}, child: Text("3x2",style: TextStyle(fontSize:30,color: Colors.white),)),
                      SizedBox(width: 100,),ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white),onPressed: (){
                        Navigator.push((context), MaterialPageRoute(builder: (context)=>GamePage(eni: 3, boyi: 4)));}, child: Text("4x3",style: TextStyle(fontSize:30,color: Colors.white),)),],
                  ),

                  SizedBox(height: 15,),
                  Row(
                    children: [
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white),onPressed: (){
                        Navigator.push((context), MaterialPageRoute(builder: (context)=>GamePage(eni: 4, boyi: 5)));}, child: Text("5x4",style: TextStyle(fontSize:30,color: Colors.white),)),
                      SizedBox(width: 100,),
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white),onPressed: (){Navigator.push((context), MaterialPageRoute(builder: (context)=>GamePage(eni: 5, boyi: 6)));}, child: Text("6x5",style: TextStyle(fontSize:30,color: Colors.white),)),],
                  ),

                  SizedBox(height: 15,),
                  Row(
                    children: [
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white),onPressed: (){Navigator.push((context), MaterialPageRoute(builder: (context)=>GamePage(eni: 6, boyi: 8)));}, child: Text("8x6",style: TextStyle(fontSize:30,color: Colors.white),)),
                      SizedBox(width: 100,),ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white),onPressed: (){Navigator.push((context), MaterialPageRoute(builder: (context)=>MultiPlayerPage(eni: 5, boyi: 6)));}, child: Text("2\nplayers",style: TextStyle(fontSize:15,color: Colors.white),)),],
                  ),



                ])),

            Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset("assets/images/img.png",width: 180,height: 175,fit: BoxFit.cover,)),
          ],
        ),
      ),
    );
  }
}
