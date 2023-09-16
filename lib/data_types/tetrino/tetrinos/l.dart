import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
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
  String positionSymbol = 'one';

  @override
  int columnsLength;

  L({required this.columnsLength});

  @override
  List<int> fourToOne(int columnsLength) {
    int new0 = currentPosition[0] - 1;
    int new1 = currentPosition[1] + 1;
    int new2 = currentPosition[2] + columnsLength;
    int new3 = currentPosition[3] + columnsLength;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> oneToTwo(int columnsLength) {
    int new0 = (currentPosition[0] + columnsLength) - 1;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] - columnsLength) + 1;
    int new3 = currentPosition[3] - 2;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> twoToThree(int columnsLength) {
    int new0 = (currentPosition[0] - columnsLength) + 1;
    int new1 = (currentPosition[1] - columnsLength) + 1;
    int new2 = currentPosition[2];
    int new3 = currentPosition[3] + 2;
    return [new0, new1, new2, new3];
  }

  @override
  List<int> threeToFour(int columnsLength) {
    int new0 = currentPosition[0] + 1;
    int new1 = (currentPosition[1] + columnsLength) - 2;
    int new2 = currentPosition[2] - 1;
    int new3 = (currentPosition[3] - columnsLength);
    return [new0, new1, new2, new3];
  }
}
