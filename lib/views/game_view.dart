import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/bottom/bottom.dart';
import 'package:simple_tetris/widgets/grid/grid.dart';
import 'package:simple_tetris/widgets/top/top.dart';

class GameView extends StatefulWidget {
  final String name;
  const GameView({required this.name, super.key});

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
    Controller controller = Get.put(Controller());
    controller.updateName(widget.name);
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Top(),
            Grid(),
            Bottom(),
          ],
        ));
  }
}
