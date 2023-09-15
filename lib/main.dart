import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/views/game.dart';

/*
git push https://github.com/MohammedSolyman/simple_tetris.git master





down move
generalization of start position
all rotatios are clockwise
winngig
game over
rotation

*/
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return const GetMaterialApp(
      home: Game(),
    );
  }
}
