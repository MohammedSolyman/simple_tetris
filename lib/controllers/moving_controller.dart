import 'package:simple_tetris/controllers/score_controller.dart';

class MovingController extends ScoreController {
  void moveRight() {
    if (isInNotOccupiedRight() && isContinousRight()) {
      restoreGridColor();
      gridModel.update((val) {
        gridModel.update((val) {
          for (int i = 0;
              i < val!.currentTetrino!.currentPosition.length;
              i++) {
            val.currentTetrino!.currentPosition[i] += 1;
          }
        });
      });

      changeGridColor();
    }
  }

  void moveLeft() {
    if (isInNotOccupiedLeft() && isContinousLeft()) {
      restoreGridColor();
      gridModel.update((val) {
        gridModel.update((val) {
          for (int i = 0;
              i < val!.currentTetrino!.currentPosition.length;
              i++) {
            val.currentTetrino!.currentPosition[i] -= 1;
          }
        });
      });

      changeGridColor();
    }
  }

  void moveDown() {
    if (isInNotOccupiedDown()) {
      restoreGridColor();

      gridModel.update((val) {
        for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
          val.currentTetrino!.currentPosition[i] += val.level.columnsLength;
        }
      });

      changeGridColor();
    }
  }

  void land() {
    gridModel.update((val) {
      for (int index in val!.currentTetrino!.currentPosition) {
        if (index >= 0 && index < gridModel.value.cells.length) {
          val.cells[index].isOcuppied = true;
        }
      }
    });
  }
}
