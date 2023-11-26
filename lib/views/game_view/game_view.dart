import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/my_animation_controller/my_animation_controller.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/views/game_view/components/bottom/bottom.dart';
import 'package:simple_tetris/views/game_view/components/dialoges/dialog_exit.dart';
import 'package:simple_tetris/views/game_view/components/grid/grid.dart';
import 'package:simple_tetris/views/game_view/components/top/top.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    Get.put(MyAnimationController());
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
