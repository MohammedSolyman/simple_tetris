import 'package:flutter/src/material/colors.dart';
import 'package:simple_tetris/constants/tetrinos_colors.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_names.dart';

class Stick implements TetrinoBase {
  @override
  MaterialColor color = TetrinosColors.tetrinosColors[TetrinosNames.stick];

  @override
  List<int> currentPosition = [-26, -16, -6];
  //List<int> currentPosition = [4, 14, 24, 25];

  @override
  List<int> initialPosition = [-26, -16, -6];
  //List<int> initialPosition = [4, 14, 24, 25];
}
