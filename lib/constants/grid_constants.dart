import 'package:simple_tetris/data_types/level/level.dart';

class GridConstants {
  static Level one = Level(
      level: 'one',
      columnsLength: 10,
      rowsLength: 15,
      duration: const Duration(milliseconds: 1000));

  static Level two = Level(
      level: 'two',
      columnsLength: 13,
      rowsLength: 18,
      duration: const Duration(milliseconds: 800));

  static Level three = Level(
      level: 'three',
      columnsLength: 15,
      rowsLength: 20,
      duration: const Duration(milliseconds: 600));

  static Level four = Level(
      level: 'four',
      columnsLength: 15,
      rowsLength: 20,
      duration: const Duration(milliseconds: 400));

  static Level five = Level(
      level: 'five',
      columnsLength: 15,
      rowsLength: 20,
      duration: const Duration(milliseconds: 200));
}
