import 'dart:async';
import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/controllers/initial_controller.dart';

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
class Controller extends InitialController {
  start() {
    initializeCurrentTetrino();
    playAudio(MyAudio.start);
    gridModel.update((val) {
      val!.timer =
          Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
        print(timer.tick);

        if (isInNotOccupiedDown()) {
          moveDown();
        } else {
          land();
          await lineComplete();
          initializeCurrentTetrino();
        }
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
    initializeGrid();
    start();
  }

  @override
  void onClose() {
    gridModel.update((val) {
      val!.timer!.cancel();
    });
  }
}
