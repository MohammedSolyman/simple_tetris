import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/views/game.dart';

/*
git push https://github.com/MohammedSolyman/simple_tetris.git master






bug: if two line are complteted
winngig
game over
rotation

*/
void main() {
  Get.put(Controller());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Game(),
    );
  }
}
