import 'package:flutter/material.dart';

abstract class TetrinoBase {
  MaterialColor color;
  //currentPosition changes every tick, and changes aslo when user change
  //positons, initially it takes the values of the initial position.
  List<int> currentPosition;

  //the initial position (position one) will be created at the beginning.
  //arrange from the lowest omdex to the highiest index.
  List<int> initialPosition;

  //positions symbols: one, two, three, four.
  String positionSymbol = 'one';

  TetrinoBase(this.color, this.currentPosition, this.initialPosition);

  //when changing, change the lowest index of the current position to the lowesest
  // index of the new position.
  //change from position four to position one.
  List<int> fourToOne(int columnsLength);

  //change from position one to position two.
  List<int> oneToTwo(int columnsLength);

  //change from position two to position three.
  List<int> twoToThree(int columnsLength);

  //change from position three to position one.
  List<int> threeToFour(int columnsLength);
}
