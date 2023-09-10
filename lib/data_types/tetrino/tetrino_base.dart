import 'package:flutter/material.dart';
import 'package:simple_tetris/data_types/cell/cell.dart';

abstract class TetrinoBase {
  MaterialColor color;
  List<int> currentPosition;
  List<int> initialPosition;
  String positionSymbol = 'one';
  TetrinoBase(this.color, this.currentPosition, this.initialPosition);

  List<int> toPositionOne(int columnsLength);
  List<int> toPositionTwo(int columnsLength);
}
