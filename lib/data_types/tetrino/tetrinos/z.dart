import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class Z implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.z];

  @override
  List<int> currentPosition = [-16, -15, -5, -4];

  @override
  List<int> initialPosition = [-16, -15, -5, -4];

  @override
  String positionSymbol = 'one';

  @override
  int columnsLength;

  Z({required this.columnsLength});

  @override
  List<int> fourToOne(int columnsLength) {
    int new0 = (currentPosition[0] + columnsLength) - 2;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] + columnsLength) - 1;
    int new3 = currentPosition[3] + 1;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> oneToTwo(int columnsLength) {
    int new0 = (currentPosition[0] - columnsLength) + 2;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] - columnsLength) + 1;
    int new3 = currentPosition[3] - 1;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> twoToThree(int columnsLength) {
    int new0 = (currentPosition[0] + columnsLength) - 2;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] + columnsLength) - 1;
    int new3 = currentPosition[3] + 1;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> threeToFour(int columnsLength) {
    int new0 = (currentPosition[0] - columnsLength) + 2;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] - columnsLength) + 1;
    int new3 = currentPosition[3] - 1;
    return [new0, new1, new2, new3];
  }
}
