import 'dart:async';
import 'package:simple_tetris/controllers/initial_controller.dart';

/*
Controller
InitialController
MovingController
ScoreController
CheckMovingController
ColorController
GetxController
*/
class Controller extends InitialController {
  start() {
    initializeCurrentTetrino();

    gridModel.update((val) {
      val!.timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        print(timer.tick);

        if (isLandDown() || isOccupiedDown()) {
          land();
          initializeCurrentTetrino();
        } else {
          moveDown();
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
