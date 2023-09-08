import 'package:flutter/material.dart';
import 'package:simple_tetris/constants/my_colors.dart';

class Cell {
  MaterialColor? color;
  //is it at most right cell in each row.
  bool? isNextRightBorder;
  //is it at most left ell in each row.
  bool? isNextLeftBorder;
  //is there any piece landed on this cell.
  bool? isOcuppied;

  Cell(
      {this.color = MyColors.black,
      this.isNextRightBorder = false,
      this.isNextLeftBorder = false,
      this.isOcuppied = false});
}
