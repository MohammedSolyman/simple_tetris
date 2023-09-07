import 'package:get/get.dart';
import 'package:simple_tetris/constants/my_colors.dart';
import 'package:simple_tetris/models/grid_model.dart';

class ColorController extends GetxController {
  Rx<GridModel> gridModel = GridModel().obs;

//restore cells' colors when tetrinos are moving
  void restoreGridColor() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        int index = val.currentTetrino!.currentPosition[i];
        if (index >= 0 && index < val.cells.length) {
          val.cells[index].color = MyColors.black;
        }
      }
    });
  }
//change cells' colors when tetrinos are moving

  void changeGridColor() {
    gridModel.update((val) {
      for (var i = 0; i < val!.currentTetrino!.currentPosition.length; i++) {
        int index = val.currentTetrino!.currentPosition[i];
        if (index >= 0 && index < val.cells.length) {
          val.cells[index].color = val.currentTetrino!.color;
        }
      }
    });
  }
}
