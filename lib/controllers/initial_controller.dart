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

class InitialController extends RotationController {
  void initializeGrid() {
    // int leftStart =
    //     gridModel.value.columnsLength - (gridModel.value.columnsLength * 9);

    // gridModel.value.mostLeft =
    //     List.generate(gridModel.value.rowsLength * 2, (index) {
    //   return leftStart + index * gridModel.value.columnsLength;
    // });
    // print('most left ----------------');
    // print(gridModel.value.mostLeft);

    // gridModel.value.mostRight =
    //     List.generate(gridModel.value.rowsLength, (index) {
    //   return (index * gridModel.value.columnsLength);
    // });

    // gridModel.value.mostRight =
    //     List.generate(gridModel.value.rowsLength, (index) {
    //   return ((index + 1) * gridModel.value.columnsLength) - 1;
    // });

    // int rightStart =
    //     gridModel.value.columnsLength - (gridModel.value.columnsLength * 9) - 1;
    // print('rightStart: $rightStart');

    // gridModel.value.mostRight =
    //     List.generate(gridModel.value.rowsLength * 2, (index) {
    //   return rightStart + index * gridModel.value.columnsLength;
    // });

    // print('most right ----------------');
    // print(gridModel.value.mostRight);

    for (int rowIndex = 0; rowIndex < gridModel.value.rowsLength; rowIndex++) {
      for (int columnIndex = 0;
          columnIndex < gridModel.value.columnsLength;
          columnIndex++) {
        Cell cell = Cell();

        // if (columnIndex == 0) {
        //   cell.isNextLeftBorder = true;
        // }
        // if (columnIndex == (gridModel.value.columnsLength - 1)) {
        //   cell.isNextRightBorder = true;
        // }

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
