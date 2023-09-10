import 'package:simple_tetris/constants/my_colors.dart';
import 'package:simple_tetris/controllers/check_moving_controller.dart';

class ScoreController extends CheckMovingController {
  Future<void> lineComplete() async {
    int startIndex =
        gridModel.value.cells.length - gridModel.value.columnsLength;

    for (var i = startIndex; i >= 0; i = i - gridModel.value.columnsLength) {
      //this ouer loop will loop the start of each lines
      //  print('outer for i = $i ------');

      bool isCompelete = true;
      int max = i + gridModel.value.columnsLength;
      for (var k = i; k < max; k++) {
        //this inner loop will loop each cell in this line.

        //   print('       inner for i = $k ------');
        if (!gridModel.value.cells[k].isOcuppied!) {
          isCompelete = false;
          break;
        }
      }

      await destroyAndShift(isCompelete, i);
      // i = i + gridModel.value.columnsLength;
      // print('row starting with $i is complete? $isCompelete');
    }
  }

  Future<void> _destroyLine(int startIndex) async {
    print(
        'destroying line starting with $startIndex...................................');

    int max = startIndex + gridModel.value.columnsLength;

    for (var i = startIndex; i < max; i++) {
      gridModel.update((val) {
        val!.cells[i].color = MyColors.black;
        val.cells[i].isOcuppied = false;
      });
    }

    //wait two second
    // await Future.delayed(Duration(seconds: 2));
  }

  void _shiftDown(int startIndex) {
    int newStart = startIndex - gridModel.value.columnsLength;

    for (var i = newStart; i >= 0; i = i - gridModel.value.columnsLength) {
      //this outer loop will loop the start of each lines

      int max = i + gridModel.value.columnsLength;

      for (var k = i; k < max; k++) {
        //this inner loop will loop each cell in this line.

        gridModel.update((val) {
          if (val!.cells[k].isOcuppied!) {
            int newIndex = k + val.columnsLength;

            //shift this cell down
            val.cells[newIndex].color = val.cells[k].color;
            val.cells[newIndex].isOcuppied = true;
            //restore this cell
            val.cells[k].color = MyColors.black;
            val.cells[k].isOcuppied = false;
          }
        });
      }
    }
  }

  Future<void> destroyAndShift(bool b, int startIndex) async {
    if (b) {
      await _destroyLine(startIndex);
      _shiftDown(startIndex);
    }
  }
}
