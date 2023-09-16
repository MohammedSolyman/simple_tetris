import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/controllers/initialization_controller.dart';
import 'package:simple_tetris/data_types/level/level.dart';

/*
Controller
InitialController
rotationController
MovingController
ScoreController
CheckMovingController
AudioController
ColorController
GetxController
*/
class Controller extends InitializationController {
  start() {
    gridModel.update((val) {
      val!.cells = [];
    });
    initializeGrid();
    initializeCurrentTetrino();
    playAudio(MyAudio.start);
    gridModel.update((val) {
      val!.timer =
          Timer.periodic(gridModel.value.level.duration, (Timer timer) async {
        print(timer.tick);

        if (isInNotOccupiedDown()) {
          moveDown();
        } else {
          land();
          await lineComplete();
          initializeCurrentTetrino();
          changeLevel();
        }
      });
    });
  }

  void changeLevel() {
    gridModel.update((val) async {
      if (val!.points > 1000 &&
          val.points < 2001 &&
          gridModel.value.level != GridConstants.two) {
        _toLevel(GridConstants.two);
      } else if (val.points > 2000 &&
          val.points < 3001 &&
          gridModel.value.level != GridConstants.three) {
        _toLevel(GridConstants.three);
      } else if (val.points > 3000 &&
          val.points < 4001 &&
          gridModel.value.level != GridConstants.four) {
        _toLevel(GridConstants.four);
      } else if (val.points > 4000 &&
          gridModel.value.level != GridConstants.five) {
        _toLevel(GridConstants.five);
      }
    });
  }

  void _toLevel(Level level) {
    playAudio(MyAudio.levelCompleted);
    gridModel.update((val) {
      val!.timer!.cancel();
    });
    gridModel.update((val) async {
      Get.defaultDialog(
          content: const Text('GOOOD JOB'), barrierDismissible: false);
      await Future.delayed(const Duration(seconds: 4));
      Get.back();
      val!.level = level;
      start();
    });
  }

  @override
  void onInit() {
    super.onInit();
    start();
  }

  @override
  void onClose() {
    gridModel.update((val) {
      val!.timer!.cancel();
    });
  }
}
