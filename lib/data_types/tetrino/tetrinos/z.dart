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

  Z({required this.columnsLength}) {
    int i0 = (((columnsLength / 2).floor()) - 1) - (2 * columnsLength) - 1;
    int i1 = i0 + 1;
    int i2 = i0 + columnsLength + 1;
    int i3 = i0 + columnsLength + 2;
    initialPosition = [i0, i1, i2, i3];
    currentPosition = [i0, i1, i2, i3];
  }

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
