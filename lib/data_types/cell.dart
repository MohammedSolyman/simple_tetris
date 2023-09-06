import 'package:flutter/material.dart';

class Cell {
  MaterialColor? color;
  //is it at most right or left cell in each row.
  bool? isBorder;
  //is there any piece landed on this cell.
  bool? isOcuppied;

  Cell(
      {this.color = Colors.brown,
      this.isBorder = false,
      this.isOcuppied = false});
}
