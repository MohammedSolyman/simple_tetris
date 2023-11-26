import 'package:simple_tetris/controllers/grid_controller.dart/moving_controller.dart';

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
  }

  void rotate() {
    if (gridModel.value.isPlaying) {
      if (gridModel.value.currentTetrino!.positionSymbol == 'one') {
        _changePostion(
            gridModel.value.currentTetrino!
                .oneToTwo(gridModel.value.level.columnsLength),
            'two');
      } else if (gridModel.value.currentTetrino!.positionSymbol == 'two') {
        _changePostion(
            gridModel.value.currentTetrino!
                .twoToThree(gridModel.value.level.columnsLength),
            'three');
      } else if (gridModel.value.currentTetrino!.positionSymbol == 'three') {
        _changePostion(
            gridModel.value.currentTetrino!
                .threeToFour(gridModel.value.level.columnsLength),
            'four');
      } else if (gridModel.value.currentTetrino!.positionSymbol == 'four') {
        _changePostion(
            gridModel.value.currentTetrino!
                .fourToOne(gridModel.value.level.columnsLength),
            'one');
      }
    }
  }
}
