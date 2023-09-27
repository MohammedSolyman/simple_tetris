import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/initialization_controller.dart';
import 'package:simple_tetris/controllers/home_page_controller/home_page_controller.dart';
import 'package:simple_tetris/services/database/database_helper.dart';
import 'package:simple_tetris/services/audio/audio.dart';
import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/data_types/level/level.dart';
import 'package:simple_tetris/views/game_view/components/dialoges/dialog_level_completed.dart';

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
  restart() {
    gridModel.update((val) {
      val!.level = GridConstants.one;
    });
    start();
  }

  start() {
    gridModel.update((val) {
      val!.cells = [];
    });
    initializeGrid();
    initializeCurrentTetrino();
    Audio.playAudio(path: MyAudio.start, isLoop: false);
    gridModel.update((val) {
      val!.timer =
          Timer.periodic(gridModel.value.level.duration, (Timer timer) async {
        if (val.isPlaying && val.isNotDestroying) {
          //if the game is being played. ie the user didn't click on 'pause'
          //icon AND there is no line is being destroyed right now ...
          if (isInNotOccupiedDown()) {
            //if there is not tetrino piece underneath, move the current tetrino
            //piece downward.
            moveDown();
          } else {
            land();
            await lineComplete();
            await gameOver();
            initializeCurrentTetrino();
            changeLevel();
          }
        }
      });
    });
  }

  void changeLevel() {
    gridModel.update((val) async {
      if (val!.points > 900 &&
          val.points < 1901 &&
          gridModel.value.level != GridConstants.two) {
        _toLevel(GridConstants.two);
      } else if (val.points > 1900 &&
          val.points < 2901 &&
          gridModel.value.level != GridConstants.three) {
        _toLevel(GridConstants.three);
      } else if (val.points > 2900 &&
          val.points < 3901 &&
          gridModel.value.level != GridConstants.four) {
        _toLevel(GridConstants.four);
      } else if (val.points > 3900 &&
          gridModel.value.level != GridConstants.five) {
        _toLevel(GridConstants.five);
      }
    });
  }

  void _toLevel(Level level) {
    Audio.playAudio(path: MyAudio.levelCompleted, isLoop: false);
    gridModel.update((val) {
      val!.timer!.cancel();
    });
    gridModel.update((val) async {
      await dialogLevelCompleted();
      val!.level = level;

      start();
    });
  }

  void pause() {
    gridModel.update((val) {
      val!.isPlaying = false;
    });
  }

  void resume() {
    gridModel.update((val) {
      val!.isPlaying = true;
    });
  }

  Future<void> saveScore() async {
    //add player name and score to the database
    DatabaseHelper helper = DatabaseHelper();

    Map<String, dynamic> map = {
      'name': gridModel.value.name,
      'score': gridModel.value.points,
    };

    await helper.create(map);
    //exit the application
  }

  updateName() {
    String name = Get.find<HompePageController>().homePageModel.value.name;

    gridModel.update((val) {
      val!.name = name;
    });
  }

  Future<void> exitApp() async {
    //exit full screen mode.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    //exit application.
    await SystemNavigator.pop();
  }

  @override
  void onInit() {
    super.onInit();
    updateName();
    start();
  }

  @override
  void onClose() {
    gridModel.update((val) {
      val!.timer!.cancel();
    });
  }
}
