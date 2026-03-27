import 'package:animation/Memorygame/GamePage.dart';
import 'package:animation/Memorygame/Select_type.dart';
import 'package:animation/Memorygame/firstpage.dart';
import 'package:animation/Memorygame/homememorypage.dart';
import 'package:animation/Memorygame/others.dart';
import 'package:animation/Memorygame/soccer.dart';
import 'package:animation/Pages/ProgressCirclePage.dart';
import 'package:animation/Pages/paintpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'Pages/Homepage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: firstpage( )
    );
  }
}




