import 'dart:async';
import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/level/level.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';

class GridModel {
  Level level = GridConstants.one;
  int points = 0;
  List<Cell> cells = [];
  TetrinoBase? currentTetrino;
  Timer? timer;
}
