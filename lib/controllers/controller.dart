import 'package:get/get.dart';
import 'package:simple_tetris/models/grid_model.dart';

class Controller extends GetxController {
  Rx<GridModel> gridModel = GridModel().obs;

  @override
  void onInit() {
    super.onInit();
    gridModel.value.initializeGrid();
  }
}
