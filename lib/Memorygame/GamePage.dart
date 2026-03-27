import 'package:animation/Memorygame/others.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homememorypage.dart';
import 'package:audioplayers/audioplayers.dart';



class GamePage extends StatefulWidget {
  int eni;
  int boyi;
  GamePage({super.key,required this.eni,required this.boyi});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late int totalCards;
  late List<String> gameimages;
  late List<bool> matched;
  late List<String> baseimages;
  bool isnotMain=true;
  List<int> openedIndexes = [];
  bool isSoundOn=false;
  int level = 1;
  final AudioPlayer player = AudioPlayer();
  int get gridCount{
    if (level == 1) return 4;
    if (level == 2) return 6;
    if (level == 1) return 8;
    return 10;
  }

  List<String> getImages() {
    int pairCount = totalCards ~/ 2;

    List<String> selected = baseimages.take(pairCount).toList();

    return [...selected, ...selected];
  }
  bool isLevelCompleted(){
    return matched.every((e) => e == true);
  }

  @override
  void initState() {
    super.initState();
    totalCards = widget.eni * widget.boyi;
    baseimages = [
      "assets/images/kanga.png",
      "assets/images/pink.png",
      "assets/images/rabbit.png",
      "assets/images/eeyore.png",
      "assets/images/tiger.png",
      "assets/images/winni.png",
      "assets/images/zmeya.png",
      "assets/images/zebra.png",
      "assets/images/zayka.png",
      "assets/images/zayitsizmasha.png",
      "assets/images/volk.png",
      "assets/images/tyador.png",
      "assets/images/tom.png",
      "assets/images/Stich.png",
      "assets/images/sit.png",
      "assets/images/Simba.png",
      "assets/images/po.png",
      "assets/images/panda_iz_mashi.png",
      "assets/images/moris.png",
      "assets/images/mikki.png",
      "assets/images/maya.png",
      "assets/images/masha.png",
      "assets/images/leapold.png",
      "assets/images/korsichqon.png",
      "assets/images/handsomecat.png",
      "assets/images/greydog.png",
      "assets/images/fox.png",
      "assets/images/donaldduck.png",
      "assets/images/dolmatin.png",
      "assets/images/dog.png",
      "assets/images/cheburashka.png",
      "assets/images/cat.png",
      "assets/images/brown.png",
      "assets/images/belka.png",
      "assets/images/barboskina.png",
    ];
    gameimages = getImages();
    gameimages.shuffle();

    matched = List.generate(gameimages.length, (_) => false);

    // TODO: implement initState
  }
  void checkMatch() {
    int first = openedIndexes[0];
    int second = openedIndexes[1];
    if (gameimages[first] == gameimages[second]) {
      setState(() {
        matched[first] = true;
        matched[second] = true;
      });
    }
    setState(() {
      openedIndexes.clear();
    });

  }

  void onCardTap(int index) {
    if (openedIndexes.length == 2) return;
    if (openedIndexes.contains(index)) return;
    if (matched[index]) return;
    setState(() {
      openedIndexes.add(index);
    });
    if (openedIndexes.length == 2) {
      Future.delayed(const Duration(milliseconds: 800), checkMatch);
    }
  }
  bool Onsound(){
    if(isSoundOn==false){


      return isSoundOn=true;
    }
    else{

      return isSoundOn=false;
    }
  }
  void music(){
    if(isSoundOn&&isnotMain){
      player.play(AssetSource('sounds/forbackround.mp3'),);
      player.setReleaseMode(ReleaseMode.loop);
    }
    else{
      player.stop();
    }
  }
void restartGame(){
    setState(() {
      openedIndexes.clear();
      matched=List.generate(gameimages.length, (_)=>false);
      gameimages.shuffle();
    });
}
bool isWin()=>matched.every((e)=>e);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [

            /// 🔥 GRID (TO‘LIQ JOYNI OLADI)
            Positioned.fill(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.eni,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: gameimages.length,
                itemBuilder: (context, index) {
                  return homemmrypage(
                    imagePath: gameimages[index],
                    isOpen: openedIndexes.contains(index) || matched[index],
                    onTap: () => onCardTap(index),
                  );
                },
              ),
            ),

            /// 🎨 ORQA RASM (o‘zgarmadi)
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/img.png",
                width: 180,
                height: 175,
                fit: BoxFit.cover,
              ),
            ),

            /// 🔘 BUTTONLAR (o‘zgarmadi)
            Positioned(
              right: 0,
              bottom: 10,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        restartGame();
                      });
                    },
                    icon: Icon(Icons.restart_alt,
                        color: Colors.indigo, size: 40),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Onsound();
                        music();
                        print(isSoundOn);
                      });
                    },
                    icon: isSoundOn
                        ? Icon(Icons.music_note,
                        color: Colors.indigo, size: 40)
                        : Icon(Icons.music_off,
                        color: Colors.indigo, size: 40),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        player.stop();
                      });
                    },
                    icon:
                    Icon(Icons.home, color: Colors.indigo, size: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
