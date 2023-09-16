import 'package:simple_tetris/constants/grid_constants.dart';
import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/constants/my_colors.dart';
import 'package:simple_tetris/controllers/check_moving_controller.dart';

class ScoreController extends CheckMovingController {
  Future<void> lineComplete() async {
    int startIndex =
        gridModel.value.cells.length - gridModel.value.level.columnsLength;

    for (var i = startIndex;
        i >= 0;
        i = i - gridModel.value.level.columnsLength) {
      //this ouer loop will loop the start of each lines
      //  print('outer for i = $i ------');

      bool isCompelete = true;
      int max = i + gridModel.value.level.columnsLength;
      for (var k = i; k < max; k++) {
        //this inner loop will loop each cell in this line.

        if (!gridModel.value.cells[k].isOcuppied!) {
          isCompelete = false;
          break;
        }
      }

      if (isCompelete) {
        await _destroyLine(i);
        _shiftDown(i);
        _addPoints();
        _changeLevel();
        i = i + gridModel.value.level.columnsLength;
        playAudio(MyAudio.lineCompleted);
      }
    }
  }

  Future<void> _destroyLine(int startIndex) async {
    int max = startIndex + gridModel.value.level.columnsLength;

    for (var i = startIndex; i < max; i++) {
      gridModel.update((val) {
        val!.cells[i].color = MyColors.black;
        val.cells[i].isOcuppied = false;
      });
    }
  }

  void _shiftDown(int startIndex) {
    int newStart = startIndex - gridModel.value.level.columnsLength;

    for (var i = newStart;
        i >= 0;
        i = i - gridModel.value.level.columnsLength) {
      //this outer loop will loop the start of each lines

      int max = i + gridModel.value.level.columnsLength;

      for (var k = i; k < max; k++) {
        //this inner loop will loop each cell in this line.

        gridModel.update((val) {
          if (val!.cells[k].isOcuppied!) {
            int newIndex = k + val.level.columnsLength;

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

  // Future<void> destroyAndShift(bool b, int startIndex) async {
  //   if (b) {
  //     await _destroyLine(startIndex);
  //     _shiftDown(startIndex);
  //   }
  // }

  void _addPoints() {
    gridModel.update((val) {
      val!.points += 100;
    });
  }

  void _changeLevel() {
    gridModel.update((val) {
      if (val!.points < 1001) {
        val.level = GridConstants.one;
      } else if (val.points > 1000 && val.points < 2001) {
        val.level = GridConstants.two;
      } else if (val.points > 2000 && val.points < 3001) {
        val.level = GridConstants.three;
      } else if (val.points > 3000 && val.points < 4001) {
        val.level = GridConstants.four;
      } else if (val.points > 4000) {
        val.level = GridConstants.five;
      }
    });
  }
}
