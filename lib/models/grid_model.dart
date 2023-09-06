import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_tetris/data_types/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'dart:math';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/l.dart';
import 'package:simple_tetris/data_types/tetrino/tetrinos/stick.dart';

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

        if (columnIndex == 0 || columnIndex == (columnsLength - 1)) {
          cell.color = Colors.red;
          cell.isBorder = true;
        }
        cells.add(cell);
      }
    }
  }

  void initializeCurrentTetrino() {
    // int random =  Random().nextInt(TetrinosNames.values.length);
    int random = Random().nextInt(2);
    print('$random -----------------------------------------');
    TetrinosNames tetrinoName = TetrinosNames.values[random];

    switch (tetrinoName) {
      case TetrinosNames.l:
        currentTetrino = L();
        break;

      case TetrinosNames.stick:
        currentTetrino = Stick();
        break;

      default:
    }
  }
}
