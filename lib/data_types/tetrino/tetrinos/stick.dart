import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class Stick implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.stick];

  @override
  List<int> currentPosition = [-26, -16, -6];

  @override
  List<int> initialPosition = [-26, -16, -6];

  @override
  String positionSymbol = 'one';

  @override
  List<int> fourToOne(int columnsLength) {
    int new0 = (currentPosition[0] - columnsLength) + 1;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] + columnsLength - 1);
    return [new0, new1, new2];
  }

  @override
  List<int> oneToTwo(int columnsLength) {
    int new0 = (currentPosition[0] + columnsLength) - 1;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] - columnsLength) + 1;
    return [new0, new1, new2];
  }

  @override
  List<int> twoToThree(int columnsLength) {
    int new0 = (currentPosition[0] - columnsLength) + 1;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] + columnsLength - 1);
    return [new0, new1, new2];
  }

  @override
  List<int> threeToFour(int columnsLength) {
    int new0 = (currentPosition[0] + columnsLength) - 1;
    int new1 = currentPosition[1];
    int new2 = (currentPosition[2] - columnsLength) + 1;
    return [new0, new1, new2];
    ;
  }
}
