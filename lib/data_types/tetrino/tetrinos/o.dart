import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class O implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.o];

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
  List<int> toPositionOne(int columnsLength) {
    return currentPosition;
  }

  @override
  List<int> toPositionTwo(int columnsLength) {
    return currentPosition;
  }

  @override
  String positionSymbol = 'one';
}
