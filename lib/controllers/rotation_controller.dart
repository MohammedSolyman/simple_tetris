import 'package:simple_tetris/controllers/moving_controller.dart';

class RotationController extends MovingController {
  void _changeCurrentPositionAndSymbol(List<int> temp, String to) {
    restoreGridColor();
    gridModel.value.currentTetrino!.currentPosition = temp;
    changeGridColor();
    gridModel.value.currentTetrino!.positionSymbol = to;
  }

  void _changePostion(List<int> temp, String to) {
    if (isInNotOccupied(temp) && isContinous(temp)) {
      _changeCurrentPositionAndSymbol(temp, to);
    } else {
      for (var i = 0; i < temp.length; i++) {
        temp[i] = temp[i] - 1;
      }
      if (isInNotOccupied(temp) && isContinous(temp)) {
        _changeCurrentPositionAndSymbol(temp, to);
      } else {
        for (var i = 0; i < temp.length; i++) {
          temp[i] = temp[i] + 2;
        }
        if (isInNotOccupied(temp) && isContinous(temp)) {
          _changeCurrentPositionAndSymbol(temp, to);
        }
      }
    }

    // if (isBorderRight() || isOccupiedRight()) {
    //   //if the tetrino is next to right border or occupied cells, rotate and shift to left
    // } else if (isBorderLeft() || isOccupiedLeft()) {
    //   //if the tetrino is next to left border or occupied cells, rotate and shift to right
    //   for (var i = 0; i < temp.length; i++) {
    //     temp[i] = temp[i] + 1;
    //   }
    //   //test if the new position interfere with occupied cells & if within grid range
    //   isInNotOccupied(temp, to);
    // } else {
    //   //test if the new position interfere with occupied cells & if within grid range
    //   isInNotOccupied(temp, to);
    // }
  }

  void rotate() {
    if (gridModel.value.currentTetrino!.positionSymbol == 'one') {
      _changePostion(
          gridModel.value.currentTetrino!
              .toPositionTwo(gridModel.value.columnsLength),
          'two');
    } else if (gridModel.value.currentTetrino!.positionSymbol == 'two') {
      _changePostion(
          gridModel.value.currentTetrino!
              .toPositionOne(gridModel.value.columnsLength),
          'one');
    }
  }
}
