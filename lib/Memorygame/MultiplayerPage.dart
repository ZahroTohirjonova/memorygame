import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'homememorypage.dart';

class MultiPlayerPage extends StatefulWidget {
  final int eni;
  final int boyi;

  const MultiPlayerPage({
    super.key,
    required this.eni,
    required this.boyi,
  });

  @override
  State<MultiPlayerPage> createState() => _MultiPlayerPageState();
}

class _MultiPlayerPageState extends State<MultiPlayerPage> {

  late List<String> gameimages;
  late List<bool> matched;
  List<int> openedIndexes = [];

  List<String> baseimages = [
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

  /// 🎮 PLAYER STATE
  int currentPlayer = 1;
  int player1Score = 0;
  int player2Score = 0;

  /// 🔊 SOUND (siznikidek)
  bool isSoundOn = false;
  final AudioPlayer player = AudioPlayer();

  int get totalCards => widget.eni * widget.boyi;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    int pairCount = totalCards ~/ 2;

    List<String> selected = baseimages.take(pairCount).toList();
    gameimages = [...selected, ...selected];

    gameimages.shuffle();
    matched = List.generate(gameimages.length, (_) => false);
    openedIndexes.clear();
  }

  /// 🔄 TAP
  void onCardTap(int index) {
    if (openedIndexes.length == 2) return;
    if (openedIndexes.contains(index)) return;
    if (matched[index]) return;

    setState(() {
      openedIndexes.add(index);
    });

    if (openedIndexes.length == 2) {
      Future.delayed(const Duration(milliseconds: 700), checkMatch);
    }
  }

  /// 🧠 MATCH LOGIC
  void checkMatch() {
    int a = openedIndexes[0];
    int b = openedIndexes[1];

    if (gameimages[a] == gameimages[b]) {
      setState(() {
        matched[a] = true;
        matched[b] = true;

        if (currentPlayer == 1) {
          player1Score++;
        } else {
          player2Score++;
        }
      });
    } else {
      currentPlayer = currentPlayer == 1 ? 2 : 1;
    }

    openedIndexes.clear();

    if (matched.every((e) => e)) {
      showWinner();
    }

    setState(() {});
  }

  /// 🏆 WINNER
  void showWinner() {
    String result;

    if (player1Score > player2Score) {
      result = "Player 1 yutdi 🏆";
    } else if (player2Score > player1Score) {
      result = "Player 2 yutdi 🏆";
    } else {
      result = "Durang 🤝";
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Game Over",
            style: TextStyle(color: Colors.white)),
        content: Text(result,
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  /// 🔄 RESTART
  void restartGame() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      currentPlayer = 1;
      startGame();
    });
  }

  /// 🔊 SOUND (siznikidek)
  bool Onsound(){
    if(isSoundOn==false){
      return isSoundOn=true;
    } else {
      return isSoundOn=false;
    }
  }

  void music(){
    if(isSoundOn){
      player.play(AssetSource('sounds/forbackround.mp3'));
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [

            /// 🔥 GRID
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

            /// 🎯 SCORE PANEL
            Positioned(
              top: 450,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("P1: $player1Score",
                      style: const TextStyle(color: Colors.indigo, fontSize: 18)),
                  Text("P2: $player2Score",
                      style: const TextStyle(color: Colors.indigo, fontSize: 18)),
                  Text("Turn: Player $currentPlayer",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),

            /// 🎨 ORQA RASM
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/img.png",
                width: 200,
                height: 200,
              ),
            ),

            /// 🔘 BUTTONLAR
            Positioned(
              right: 0,
              bottom: 10,
              child: Column(
                children: [
                  IconButton(
                    onPressed: restartGame,
                    icon: const Icon(Icons.restart_alt,
                        color: Colors.indigo, size: 40),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Onsound();
                        music();
                      });
                    },
                    icon: isSoundOn
                        ? const Icon(Icons.music_note,
                        color: Colors.indigo, size: 40)
                        : const Icon(Icons.music_off,
                        color: Colors.indigo, size: 40),
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                      player.stop();
                    },
                    icon: const Icon(Icons.home,
                        color: Colors.indigo, size: 40),
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