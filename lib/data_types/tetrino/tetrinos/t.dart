import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class T implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.t];

  @override
  List<int> currentPosition = [-27, -26, -25, -16, -6];

  @override
  List<int> initialPosition = [-27, -26, -25, -16, -6];

  @override
  String positionSymbol = 'one';

  @override
  int columnsLength;

  T({required this.columnsLength});

  @override
  List<int> fourToOne(int columnsLength) {
    int new0 = currentPosition[0];
    int new1 = (currentPosition[1] - columnsLength) + 1;
    int new2 = (currentPosition[2] - columnsLength) + 1;
    int new3 = currentPosition[3] - 1;
    int new4 = currentPosition[4] + 1;

    return [new0, new1, new2, new3, new4];
  }

  @override
  List<int> oneToTwo(int columnsLength) {
    int new0 = currentPosition[0] + 2;
    int new1 = (currentPosition[1] + columnsLength) - 1;
    int new2 = (currentPosition[2] + columnsLength) - 1;
    int new3 = currentPosition[3] + 1;
    int new4 = currentPosition[4] + 1;

    return [new0, new1, new2, new3, new4];
  }

  @override
  List<int> twoToThree(int columnsLength) {
    int new0 = currentPosition[0] - 1;
    int new1 = currentPosition[1] + 1;
    int new2 = (currentPosition[2] + columnsLength) - 1;
    int new3 = (currentPosition[3] + columnsLength) - 1;
    int new4 = currentPosition[4];

    return [new0, new1, new2, new3, new4];
  }

  @override
  List<int> threeToFour(int columnsLength) {
    int new0 = currentPosition[0] - 1;
    int new1 = currentPosition[1] - 1;
    int new2 = currentPosition[2] - columnsLength + 1;

    int new3 = currentPosition[3] - columnsLength + 1;
    int new4 = currentPosition[4] - 2;

    return [new0, new1, new2, new3, new4];
  }
}
