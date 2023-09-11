import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class L implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.l];

  @override
  List<int> currentPosition = [-26, -16, -6, -5];

  @override
  List<int> initialPosition = [-26, -16, -6, -5];

  @override
  List<int> toPositionOne(int columnsLength) {
    int new0 = (currentPosition[0] - (2 * columnsLength)) + 1;
    int new1 = currentPosition[1] - columnsLength;
    int new2 = currentPosition[2] - 1;
    int new3 = currentPosition[3] + columnsLength;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> toPositionTwo(int columnsLength) {
    int new0 = (currentPosition[0] + (2 * columnsLength)) - 1;
    int new1 = currentPosition[1] + columnsLength;
    int new2 = currentPosition[2] + 1;
    int new3 = currentPosition[3] - columnsLength;
    return [new0, new1, new2, new3];
  }

  @override
  String positionSymbol = 'one';
}
