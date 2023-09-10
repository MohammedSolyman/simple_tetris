import 'package:simple_tetris/controllers/color_controller.dart';

class CheckMovingController extends ColorController {
  //before moving right or left, check the next move if it is valid commit it,
  //but if it is not valid, don't commit it.
  //we are looking at new position of the move and check the following:
  //1. if it is still in the grid, ie didn't exit the grid.
  //2. if it is NOT in occupied cells
  //3. if it is still continous (not broken), ie not any cell of the tetrino
  //migrate to the next line ffom the opposite sirection.

  bool isInNotOccupiedRight() {
    //if we shift the current tetrino to the right,, this function returns true if:
    //all cells in the new position are NOT in occupied cells. and
    //all cells in the new position are still in the grid.
    List<int> temp = gridModel.value.currentTetrino!.currentPosition;
    List<int> right = temp.map((e) => e + 1).toList();

    return right.every((element) =>
            element >= 0 && element < gridModel.value.cells.length) &&
        right.every((element) => !gridModel.value.cells[element].isOcuppied!);
  }

  bool isInNotOccupiedLeft() {
    //if we shift the current tetrino to the left, this function returns true if:
    //all cells in the new position are NOT in occupied cells. and
    //all cells in the new position are still in the grid.
    List<int> temp = gridModel.value.currentTetrino!.currentPosition;
    List<int> left = temp.map((e) => e - 1).toList();

    return left.every((element) =>
            element >= 0 && element < gridModel.value.cells.length) &&
        left.every((element) => !gridModel.value.cells[element].isOcuppied!);
  }

  bool isContinousRight() {
    //if we shift the current tetrino to the right, it returns true if this
    //tetrino is still continous.
    bool x = true;

    List<int> temp = gridModel.value.currentTetrino!.currentPosition;
    List<int> right = temp.map((e) => e + 1).toList();

    for (var i = 0; i < temp.length; i++) {
      int tempRow = (temp[i] / gridModel.value.columnsLength).floor();
      int rightRow = (right[i] / gridModel.value.columnsLength).floor();
      // int leftRow = (left[i] / gridModel.value.columnsLength).floor();

      if (tempRow == rightRow) {
      } else {
        x = false;
      }
    }
    return x;
  }

  bool isContinousLeft() {
    //if we shift the current tetrino to the left, it returns true if this
    //tetrino is still continous.
    bool x = true;

    List<int> temp = gridModel.value.currentTetrino!.currentPosition;
    List<int> left = temp.map((e) => e - 1).toList();

    for (var i = 0; i < temp.length; i++) {
      int tempRow = (temp[i] / gridModel.value.columnsLength).floor();
      int leftRow = (left[i] / gridModel.value.columnsLength).floor();

      if (tempRow == leftRow) {
      } else {
        x = false;
      }
    }
    return x;
  }

  //before moving down, check the next move if it is valid commit it,
  //but if it is not valid, don't commit it.
  //we are looking at new position of the move and check the following:
  //1. if it is still in the grid, ie didn't exit the grid.
  //2. if it is NOT in occupied cells

  bool isInNotOccupiedDown() {
    //if we shift the current tetrino downward, this function returns true if:
    //all cells in the new position are NOT in occupied cells. and
    //all cells in the new position are still in the grid.
    List<int> temp = gridModel.value.currentTetrino!.currentPosition;
    List<int> down =
        temp.map((e) => e + gridModel.value.columnsLength).toList();

    bool inGrid =
        down.every((element) => element < gridModel.value.cells.length);

    bool isNotOccupied = true;
    for (int index in down) {
      if (index >= 0 &&
          index < gridModel.value.cells.length &&
          gridModel.value.cells[index].isOcuppied!) {
        isNotOccupied = false;
      }
    }

    return inGrid && isNotOccupied;
  }

  //before rotating, check if this rotaion is valid commit it, but if it is not
  //valid, don't commit it.
  //we are looking at new position of the rotation and check the following:
  //1. if it is still in the grid, ie didn't exit the grid.
  //2. if it is NOT in occupied cells
  //3. if it is still continous (not broken), ie not any cell of the tetrino
  //migrate to the next line ffom the opposite sirection.

  bool isInNotOccupied(List<int> temp) {
    return temp.every((element) =>
            element >= 0 && element < gridModel.value.cells.length) &&
        temp.every((element) => !gridModel.value.cells[element].isOcuppied!);
  }

  bool isContinous(List<int> temp) {
    bool x = true;
    for (int i = 0; i < temp.length; i++) {
      if ((i + 1) < temp.length) {
        if ((temp[i] - temp[i + 1]).abs() == 1) {
          int thisRow = (temp[i] / gridModel.value.columnsLength).floor();
          int nextRow = (temp[i + 1] / gridModel.value.columnsLength).floor();
          if (thisRow != nextRow) {
            x = false;
          }
        }
      }
    }

    return x;
  }

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//   bool isOccupiedRight() {
//     bool x = false;
//     for (int index in gridModel.value.currentTetrino!.currentPosition) {
//       int nextIndex = index + 1;
//       if (index >= 0 &&
//           index < gridModel.value.cells.length &&
//           gridModel.value.cells[nextIndex].isOcuppied!) {
//         x = true;
//       }
//     }
//     return x;
//   }

//   bool isOccupiedLeft() {
//     //if we shift the current tetrino to the left, it returns true if all cells in
//     //the new position are NOT in occupied cells.
//     bool x = false;
//     for (int index in gridModel.value.currentTetrino!.currentPosition) {
//       int nextIndex = index - 1;
//       if (index >= 0 &&
//           index < gridModel.value.cells.length &&
//           gridModel.value.cells[nextIndex].isOcuppied!) {
//         x = true;
//       }
//     }
//     return x;
//   }

//   bool isBorderLeft() {
//     return gridModel.value.currentTetrino!.currentPosition
//         .any((int index) => gridModel.value.mostLeft.contains(index));

//     // bool x = false;
//     // for (int index in gridModel.value.currentTetrino!.currentPosition) {
//     //   if (index >= 0 &&
//     //       index < gridModel.value.cells.length &&
//     //       gridModel.value.cells[index].isNextLeftBorder!) {
//     //     x = true;
//     //   }
//     // }
//     // return x;
//   }

//   bool isLandDown() {
//     bool x = false;
//     for (int index in gridModel.value.currentTetrino!.currentPosition) {
//       int nextIndex = index + gridModel.value.columnsLength;

//       if (nextIndex >= gridModel.value.cells.length) {
//         x = true;
//       }
//     }
//     return x;
//   }

//   bool isOccupiedDown() {
//     bool x = false;
//     for (int index in gridModel.value.currentTetrino!.currentPosition) {
//       int nextIndex = index + gridModel.value.columnsLength;

//       if (nextIndex >= 0 &&
//           nextIndex < gridModel.value.cells.length &&
//           gridModel.value.cells[nextIndex].isOcuppied!) {
//         x = true;
//       }
//     }
//     return x;
//   }

//   bool isBorderRight() {
//     return gridModel.value.currentTetrino!.currentPosition
//         .any((int index) => gridModel.value.mostRight.contains(index));

//     // for (int index in gridModel.value.currentTetrino!.currentPosition) {
//     //   if (gridModel.value.cells[index].isNextRightBorder!) {
//     //     x = true;
//     //   }
//     // }

//     // bool x = false;
//     // for (int index in gridModel.value.currentTetrino!.currentPosition) {
//     //   if (index >= 0 &&
//     //       index < gridModel.value.cells.length &&
//     //       gridModel.value.cells[index].isNextRightBorder!) {
//     //     x = true;
//     //   }
//     // }
//     // return x;
//   }
// }
}
