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
}
