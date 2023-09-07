import 'dart:math';
import 'package:simple_tetris/controllers/moving_controller.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/dash.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/l.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/o.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/s.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/stick.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/t.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/z.dart';

class InitialController extends MovingController {
  void initializeGrid() {
    for (int rowIndex = 0; rowIndex < gridModel.value.rowsLength; rowIndex++) {
      for (int columnIndex = 0;
          columnIndex < gridModel.value.columnsLength;
          columnIndex++) {
        Cell cell = Cell();

        if (columnIndex == 0) {
          cell.isNextLeftBorder = true;
        }
        if (columnIndex == (gridModel.value.columnsLength - 1)) {
          cell.isNextRightBorder = true;
        }
        if (rowIndex == (gridModel.value.rowsLength - 1)) {
          cell.isNextDownBorder = true;
        }
        gridModel.value.cells.add(cell);
      }
    }
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
}
