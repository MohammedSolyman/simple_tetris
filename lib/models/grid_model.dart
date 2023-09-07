import 'dart:async';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';

class GridModel {
  int rowsLength = 15;
  int columnsLength = 10;
  List<Cell> cells = [];
  TetrinoBase? currentTetrino;
  Timer? timer;

  void initializeGrid() {
    for (int rowIndex = 0; rowIndex < rowsLength; rowIndex++) {
      for (int columnIndex = 0; columnIndex < columnsLength; columnIndex++) {
        Cell cell = Cell();

        if (columnIndex == 0) {
          cell.isNextLeftBorder = true;
        }
        if (columnIndex == (columnsLength - 1)) {
          cell.isNextRightBorder = true;
        }
        if (rowIndex == (rowsLength - 1)) {
          cell.isNextDownBorder = true;
        }
        cells.add(cell);
      }
    }
  }
}
