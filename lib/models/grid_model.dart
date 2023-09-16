import 'dart:async';
import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';

class GridModel {
  int rowsLength = GridConstants.one.rowsLength;
  int columnsLength = GridConstants.one.columnsLength;
  int points = 0;
  String level = GridConstants.one.level;
  List<Cell> cells = [];
  TetrinoBase? currentTetrino;
  Timer? timer;
}
