import 'package:simple_tetris/controllers/color_controller.dart';

class CheckMovingController extends ColorController {
  //before moving, check the next move:
  bool isLandDown() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      int nextIndex = index + gridModel.value.columnsLength;

      if (nextIndex >= gridModel.value.cells.length) {
        x = true;
      }
    }
    return x;
  }

  bool isOccupiedDown() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      int nextIndex = index + gridModel.value.columnsLength;

      if (nextIndex >= 0 &&
          nextIndex < gridModel.value.cells.length &&
          gridModel.value.cells[nextIndex].isOcuppied!) {
        x = true;
      }
    }
    return x;
  }

  bool isBorderRight() {
    return gridModel.value.currentTetrino!.currentPosition
        .any((int index) => gridModel.value.mostRight.contains(index));

    // for (int index in gridModel.value.currentTetrino!.currentPosition) {
    //   if (gridModel.value.cells[index].isNextRightBorder!) {
    //     x = true;
    //   }
    // }

    // bool x = false;
    // for (int index in gridModel.value.currentTetrino!.currentPosition) {
    //   if (index >= 0 &&
    //       index < gridModel.value.cells.length &&
    //       gridModel.value.cells[index].isNextRightBorder!) {
    //     x = true;
    //   }
    // }
    // return x;
  }

  bool isOccupiedRight() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      int nextIndex = index + 1;
      if (index >= 0 &&
          index < gridModel.value.cells.length &&
          gridModel.value.cells[nextIndex].isOcuppied!) {
        x = true;
      }
    }
    return x;
  }

  bool isOccupiedLeft() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      int nextIndex = index - 1;
      if (index >= 0 &&
          index < gridModel.value.cells.length &&
          gridModel.value.cells[nextIndex].isOcuppied!) {
        x = true;
      }
    }
    return x;
  }

  bool isBorderLeft() {
    return gridModel.value.currentTetrino!.currentPosition
        .any((int index) => gridModel.value.mostLeft.contains(index));

    // bool x = false;
    // for (int index in gridModel.value.currentTetrino!.currentPosition) {
    //   if (index >= 0 &&
    //       index < gridModel.value.cells.length &&
    //       gridModel.value.cells[index].isNextLeftBorder!) {
    //     x = true;
    //   }
    // }
    // return x;
  }
}
