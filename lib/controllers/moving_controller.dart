import 'package:simple_tetris/controllers/score_controller.dart';

class MovingController extends ScoreController {
  //moving
  void moveDown() {
    restoreGridColor();

    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        val.currentTetrino!.currentPosition[i] += val.columnsLength;
      }
    });

    changeGridColor();
  }

  void moveRight() {
    restoreGridColor();
    if (!isBorderRight() && !isOccupiedRight()) {
      gridModel.update((val) {
        for (int i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
          val.currentTetrino!.currentPosition[i] += 1;
        }
      });
    }
    changeGridColor();
  }

  void moveLeft() {
    restoreGridColor();

    if (!isBorderLeft() && !isOccupiedLeft()) {
      gridModel.update((val) {
        for (int i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
          val.currentTetrino!.currentPosition[i] -= 1;
        }
      });
    }
    changeGridColor();
  }

  void rotate() {}

  void land() {
    print('landing...');
    gridModel.update((val) {
      for (int index in val!.currentTetrino!.currentPosition) {
        if (index >= 0 && index < gridModel.value.cells.length) {
          val.cells[index].isOcuppied = true;
        }
      }
    });

    isRowComplete();
  }
}
