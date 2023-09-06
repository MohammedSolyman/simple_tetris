import 'package:flutter/material.dart';
import 'package:simple_tetris/data_types/cell.dart';

class GridModel {
  int rowsLength = 15;
  int columnsLength = 10;
  List<Cell> cells = [];

  void initializeGrid() {
    for (int rowIndex = 0; rowIndex < rowsLength; rowIndex++) {
      for (int columnIndex = 0; columnIndex < columnsLength; columnIndex++) {
        Cell cell = Cell();
        if (columnIndex == 0 || columnIndex == (columnsLength - 1)) {
          cell.color = Colors.red;
          cell.isBorder = true;
        }
        cells.add(cell);
      }
    }
  }
}
