import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class S implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.s];

  @override
  List<int> currentPosition = [-16, -15, -7, -6];

  @override
  List<int> initialPosition = [-16, -15, -7, -6];

  @override
  String positionSymbol = 'one';

  @override
  int columnsLength;

  S({required this.columnsLength});

  @override
  List<int> fourToOne(int columnsLength) {
    int new0 = currentPosition[0] + columnsLength;
    int new1 = currentPosition[1] + 1;
    int new2 = currentPosition[2] + columnsLength - 2;
    int new3 = currentPosition[3] - 1;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> oneToTwo(int columnsLength) {
    int new0 = currentPosition[0] - columnsLength;
    int new1 = currentPosition[1] - 1;
    int new2 = currentPosition[2] - columnsLength + 2;
    int new3 = currentPosition[3] + 1;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> twoToThree(int columnsLength) {
    int new0 = currentPosition[0] + columnsLength;
    int new1 = currentPosition[1] + 1;
    int new2 = currentPosition[2] + columnsLength - 2;
    int new3 = currentPosition[3] - 1;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> threeToFour(int columnsLength) {
    int new0 = currentPosition[0] - columnsLength;
    int new1 = currentPosition[1] - 1;
    int new2 = currentPosition[2] - columnsLength + 2;
    int new3 = currentPosition[3] + 1;
    return [new0, new1, new2, new3];
  }
}
