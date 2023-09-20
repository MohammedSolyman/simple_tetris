import 'package:get/get.dart';
import 'package:simple_tetris/models/home_paage_mode.dart';
import 'package:simple_tetris/views/game_view.dart';

class HompePageController extends GetxController {
  Rx<HomePageModel> homePageModel = HomePageModel().obs;

  void goToGame(String name) {
    Get.off(GameView(
      name: name,
    ));
  }

  String getName() {
    return homePageModel.value.textEditingController.text;
  }
}