import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/views/game_view/components/bottom/bottom.dart';
import 'package:simple_tetris/views/game_view/components/dialoges/dialog_exit.dart';
import 'package:simple_tetris/views/game_view/components/grid/grid.dart';
import 'package:simple_tetris/views/game_view/components/top/top.dart';

class GameView extends StatefulWidget {
  // final String name;
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
    // controller.updateName(widget.name);
    return const WillPopScope(
      onWillPop: dialogExitBackArrow,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Top(),
              Grid(),
              Bottom(),
            ],
          )),
    );
  }
}
