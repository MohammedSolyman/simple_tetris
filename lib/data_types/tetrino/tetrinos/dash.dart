import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class Dash implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.dash];

  @override
  List<int> currentPosition = [-7, -8, -9, -10];

  @override
  List<int> initialPosition = [-7, -8, -9, -10];
}
