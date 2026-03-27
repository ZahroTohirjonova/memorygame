import 'package:animation/Memorygame/GamePage.dart';
import 'package:animation/Memorygame/Select_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  PopupMenuItem<String> menuItem(String text,String value){
    return PopupMenuItem(
        value:value,
      child: Text(text,style: TextStyle(color: Colors.white),));
  }
  Future<void> sendEmail(BuildContext context)async{
    final Uri emailUri=Uri(
      scheme: 'mailto',
      path: 'zahrotohirjonova@gmail.com',
      queryParameters:{
        'subject':'Feedback',
        'body':'Assalomu_alaykum,'
      }
    );
    try{
      await launchUrl(
        emailUri,
        mode:LaunchMode.externalApplication
      );

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email ilovasi topilmadi"))
      );

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [PopupMenuButton<String>(
            icon: Icon(Icons.send_rounded,),
            color: Colors.indigo,
            onSelected: (value){
              setState(() {
                if(value=="feedback"){
                  sendEmail(context);
                }

              });
            },

            itemBuilder: (context)=>[menuItem("Send feedback", "feedback")])],
        title: Text("MemoryGame"),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(onPressed: (){setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectType()));
            });},
                child:Text("Play game",style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo,foregroundColor: Colors.white), ),
          ),
          Positioned(
            left: 0,
              bottom: 0,
              child: Image.asset("assets/images/img.png",width: 200,height: 175,fit: BoxFit.cover,))
        ],
      )
    );

  }
}
