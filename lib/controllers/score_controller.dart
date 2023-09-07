import 'package:simple_tetris/controllers/check_moving_controller.dart';

class ScoreController extends CheckMovingController {
  isRowComplete() {
    int startIndex =
        gridModel.value.cells.length - gridModel.value.columnsLength;

    for (var i = startIndex; i >= 0; i = i - gridModel.value.columnsLength) {
      print('outer for i = $i ------');

      bool isCompelete = true;
      int max = i + gridModel.value.columnsLength;
      for (var k = i; k < max; k++) {
        print('       inner for i = $k ------');
        if (!gridModel.value.cells[k].isOcuppied!) {
          isCompelete = false;
          break;
        }
      }

      print('row starting with $i is complete? $isCompelete');
    }
  }
}
