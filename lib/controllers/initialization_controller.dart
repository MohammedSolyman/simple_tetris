import 'dart:math';
import 'package:simple_tetris/controllers/rotation_controller.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/dash.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/l.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/o.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/s.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/stick.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/t.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/z.dart';

class InitializationController extends RotationController {
  initializeGrid() {
    for (int rowIndex = 0;
        rowIndex < gridModel.value.level.rowsLength;
        rowIndex++) {
      for (int columnIndex = 0;
          columnIndex < gridModel.value.level.columnsLength;
          columnIndex++) {
        Cell cell = Cell();

        gridModel.value.cells.add(cell);
      }
    }
  }

  void initializeCurrentTetrino() {
    // gridModel.value.currentTetrino =
    //     Test(columnsLength: gridModel.value.level.columnsLength);

    int random = Random().nextInt(TetrinosNames.values.length);
    TetrinosNames tetrinoName = TetrinosNames.values[random];

    switch (tetrinoName) {
      case TetrinosNames.l:
        gridModel.value.currentTetrino =
            L(columnsLength: gridModel.value.level.columnsLength);
        break;

      case TetrinosNames.stick:
        gridModel.value.currentTetrino =
            Stick(columnsLength: gridModel.value.level.columnsLength);
        break;

      case TetrinosNames.dash:
        gridModel.value.currentTetrino =
            Dash(columnsLength: gridModel.value.level.columnsLength);
        break;

      case TetrinosNames.s:
        gridModel.value.currentTetrino =
            S(columnsLength: gridModel.value.level.columnsLength);
        break;

      case TetrinosNames.z:
        gridModel.value.currentTetrino =
            Z(columnsLength: gridModel.value.level.columnsLength);
        break;

      case TetrinosNames.t:
        gridModel.value.currentTetrino =
            T(columnsLength: gridModel.value.level.columnsLength);
        break;

      case TetrinosNames.o:
        gridModel.value.currentTetrino =
            O(columnsLength: gridModel.value.level.columnsLength);
        break;

      default:
    }
  }
}
