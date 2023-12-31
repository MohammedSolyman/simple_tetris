import 'dart:async';
import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';
import 'package:simple_tetris/data_types/level/level.dart';
import 'package:simple_tetris/data_types/tetrino/tetrino_base.dart';

class GridModel {
  //current user name
  String? name;
  //the game starts with level one, and increases whenever the user complete a
  //level.
  Level level = GridConstants.one;
  //the gained points by the user.
  int points = 0;
  //the cells represening the playing grid.
  List<Cell> cells = [];
  //it is allowed to have one active moving tetrino at once.
  TetrinoBase? currentTetrino;
  //the timer of the game.
  Timer? timer;
  //is the user play now? it is true if the user is playing, if the game is pause
  //it will be false.
  bool isPlaying = true;
  //is the row of settings icons visible or not, if the user clicks on the
  //settings icons it truen true, if the user clicls on the settings icons again,
  //it turns false;
  bool isVisibleIcons = false;
  //when the line is being destroyed, it will be false, otherwise it becomes true.
  bool isNotDestroying = true;

  bool isVolumeOn = true;
}
