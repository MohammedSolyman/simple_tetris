import 'dart:math';
import 'package:get/get.dart';
import 'package:simple_tetris/constants/my_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/dash.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/l.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/o.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/s.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/stick.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/t.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/z.dart';
import 'package:simple_tetris/models/grid_model.dart';

class InitialController extends GetxController {
  Rx<GridModel> gridModel = GridModel().obs;

//change cells' colors when tetrinos are moving
  void _unChangeGridColor() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        int index = val.currentTetrino!.currentPosition[i];
        if (index >= 0 && index < val.cells.length) {
          val.cells[index].color = MyColors.black;
        }
      }
    });
  }

  void _changeGridColor() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        int index = val.currentTetrino!.currentPosition[i];
        if (index >= 0 && index < val.cells.length) {
          val.cells[index].color = val.currentTetrino!.color;
        }
      }
    });
  }

//before moving, check the next move:
  bool isLandDown() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      if (index >= 0 &&
          index < gridModel.value.cells.length &&
          gridModel.value.cells[index].isNextDownBorder!) {
        x = true;
      }
    }
    return x;
    // int maxPosition =
    //     gridModel.value.currentTetrino!.currentPosition.reduce(max);

    // bool x = false;
    // if (maxPosition >= 0 &&
    //     maxPosition < gridModel.value.cells.length &&
    //     gridModel.value.cells[maxPosition].isNextDownBorder!) {
    //   x = true;
    // }
    // return x;
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

  bool _isBorderRight() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      if (index >= 0 &&
          index < gridModel.value.cells.length &&
          gridModel.value.cells[index].isNextRightBorder!) {
        x = true;
      }
    }
    return x;
  }

  bool _isOccupiedRight() {
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

  bool _isOccupiedLeft() {
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

  bool _isBorderLeft() {
    bool x = false;
    for (int index in gridModel.value.currentTetrino!.currentPosition) {
      if (index >= 0 &&
          index < gridModel.value.cells.length &&
          gridModel.value.cells[index].isNextLeftBorder!) {
        x = true;
      }
    }
    return x;
  }

  void initializeCurrentTetrino() {
    int random = Random().nextInt(TetrinosNames.values.length);
    TetrinosNames tetrinoName = TetrinosNames.values[random];

    switch (tetrinoName) {
      case TetrinosNames.l:
        gridModel.value.currentTetrino = L();
        break;

      case TetrinosNames.stick:
        gridModel.value.currentTetrino = Stick();
        break;

      case TetrinosNames.dash:
        gridModel.value.currentTetrino = Dash();
        break;

      case TetrinosNames.s:
        gridModel.value.currentTetrino = S();
        break;

      case TetrinosNames.z:
        gridModel.value.currentTetrino = Z();
        break;

      case TetrinosNames.t:
        gridModel.value.currentTetrino = T();
        break;

      case TetrinosNames.o:
        gridModel.value.currentTetrino = O();
        break;

      default:
    }
  }

//moving
  void moveDown() {
    _unChangeGridColor();

    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        val.currentTetrino!.currentPosition[i] += val.columnsLength;
      }
    });

    _changeGridColor();
  }

  void moveRight() {
    _unChangeGridColor();
    if (!_isBorderRight() && !_isOccupiedRight()) {
      gridModel.update((val) {
        for (int i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
          val.currentTetrino!.currentPosition[i] += 1;
        }
      });
    }
    _changeGridColor();
  }

  void moveLeft() {
    _unChangeGridColor();

    if (!_isBorderLeft() && !_isOccupiedLeft()) {
      gridModel.update((val) {
        for (int i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
          val.currentTetrino!.currentPosition[i] -= 1;
        }
      });
    }
    _changeGridColor();
  }

  void rotate() {}

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
