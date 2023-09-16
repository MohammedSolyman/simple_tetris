import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class O implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.o];

  @override
  int columnsLength;

  O({required this.columnsLength});

  @override
  List<int> currentPosition = [
    -16,
    -15,
    -6,
    -5,
  ];
  @override
  List<int> initialPosition = [
    -16,
    -15,
    -6,
    -5,
  ];

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
