import 'dart:async';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/initialization_controller.dart';
import 'package:simple_tetris/services/database/database_helper.dart';
import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/controllers/home_page_controller/home_page_controller.dart';
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
  HompePageController hompePageController = Get.put(HompePageController());

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
    playAudio(MyAudio.start);
    gridModel.update((val) {
      val!.timer =
          Timer.periodic(gridModel.value.level.duration, (Timer timer) async {
        if (val.isPlaying) {
          print(timer.tick);

          if (isInNotOccupiedDown()) {
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

  exit() async {
    DatabaseHelper helper = DatabaseHelper();

    Map<String, dynamic> map = {
      'name': gridModel.value.name,
      'score': gridModel.value.points,
    };

    await helper.create(map);
  }

  updateName(String name) {
    gridModel.update((val) {
      val!.name = name;
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
