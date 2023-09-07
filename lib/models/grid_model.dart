import 'dart:async';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';

class GridModel {
  int rowsLength = 15;
  int columnsLength = 10;
  List<Cell> cells = [];
  TetrinoBase? currentTetrino;
  Timer? timer;
}
