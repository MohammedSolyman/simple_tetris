import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class S implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.s];

  @override
  List<int> currentPosition = [];

  @override
  List<int> initialPosition = [];

  @override
  String positionSymbol = 'one';

  @override
  int columnsLength;

  S({required this.columnsLength}) {
    int i0 = (((columnsLength / 2).floor()) - 1) - (2 * columnsLength);
    int i1 = i0 + 1;
    int i2 = i0 + columnsLength - 1;
    int i3 = i0 + columnsLength;
    initialPosition = [i0, i1, i2, i3];
    currentPosition = [i0, i1, i2, i3];
  }
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
