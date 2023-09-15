import 'package:flutter/material.dart';
import 'package:simple_tetris/views/game_view/components.dart/botton.dart';
import 'package:simple_tetris/views/game_view/components.dart/grid.dart';
import 'package:simple_tetris/views/game_view/components.dart/top.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller controller = Get.find<Controller>();

    return const Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          children: [
            Top(),
            Grid(),
            Botton(),
          ],
        ));
  }
}
