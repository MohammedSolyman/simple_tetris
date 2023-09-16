import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class O implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.o];

  @override
  int columnsLength;

  @override
  List<int> currentPosition = [];
  @override
  List<int> initialPosition = [];

  O({required this.columnsLength}) {
    int i0 = (((columnsLength / 2).floor()) - 1) - (2 * columnsLength);
    int i1 = i0 + 1;
    int i2 = i0 + columnsLength;
    int i3 = i0 + columnsLength + 1;
    initialPosition = [i0, i1, i2, i3];
    currentPosition = [i0, i1, i2, i3];
  }

  @override
  List<int> fourToOne(int columnsLength) {
    return currentPosition;
  }

  @override
  List<int> oneToTwo(int columnsLength) {
    return currentPosition;
  }

  @override
  String positionSymbol = 'one';

  @override
  List<int> twoToThree(int columnsLength) {
    return currentPosition;
  }

  @override
  List<int> threeToFour(int columnsLength) {
    return currentPosition;
  }
}
