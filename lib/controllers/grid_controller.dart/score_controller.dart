import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/constants/my_colors.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/check_moving_controller.dart';
import 'package:simple_tetris/services/audio/audio.dart';
import 'package:simple_tetris/views/game_view/components/dialoges/dialog_game_over.dart';
import 'package:vibration/vibration.dart';

class ScoreController extends CheckMovingController {
  Future<void> lineComplete() async {
    int startIndex =
        gridModel.value.cells.length - gridModel.value.level.columnsLength;

    for (var i = startIndex;
        i >= 0;
        i = i - gridModel.value.level.columnsLength) {
      //this ouer loop will loop the start of each lines

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
        Audio.playAudio(path: MyAudio.lineCompleted, isLoop: false);
        i = i + gridModel.value.level.columnsLength;
      }
    }
  }

  Future<void> _destroyLine(int startIndex) async {
    gridModel.update((val) {
      val!.isNotDestroying = false;
    });
    int max = startIndex + gridModel.value.level.columnsLength;

    for (var i = startIndex; i < max; i++) {
      gridModel.update((val) {
        val!.cells[i].color = MyColors.black;
        val.cells[i].isOcuppied = false;
      });
      await Future.delayed(const Duration(milliseconds: 30));
    }
// vibrate 30 milliseconds for each cell.
    if (await Vibration.hasVibrator() == true) {
      await Vibration.vibrate(
          duration: 30 * (gridModel.value.level.columnsLength));
    }

    gridModel.update((val) {
      val!.isNotDestroying = true;
    });
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

  void _addPoints() {
    gridModel.update((val) {
      val!.points += 100;
    });
  }

  gameOver() async {
    bool isGameOver = false;
    for (var i = 0; i < gridModel.value.level.columnsLength; i++) {
      if (gridModel.value.cells[i].isOcuppied!) {
        isGameOver = true;
        break;
      }
    }

    if (isGameOver) {
      gridModel.value.timer!.cancel();
      await Audio.playAudio(path: MyAudio.gameOver, isLoop: false);
      await dialogGameOver();
    }
  }
}
