import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
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
  List<int> toPositionOne(int columnsLength) {
    return [];
  }

  @override
  List<int> toPositionTwo(int columnsLength) {
    return [];
  }

  @override
  String positionSymbol = 'one';
}
