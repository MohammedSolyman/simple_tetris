import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/botton.dart';
import 'package:simple_tetris/widgets/grid.dart';
import 'package:simple_tetris/widgets/top.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());

    return const Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Top(),
            Grid(),
            Botton(),
          ],
        ));
  }
}
