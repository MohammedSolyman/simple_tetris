import 'package:get/get.dart';
import 'package:simple_tetris/models/home_page_model.dart';
import 'package:simple_tetris/services/audio/audio.dart';
import 'package:simple_tetris/views/game_view/game_view.dart';

class HompePageController extends GetxController {
  Rx<HomePageModel> homePageModel = HomePageModel().obs;

  void goToGame() {
    Get.off(const GameView());
  }

  void getName() {
    homePageModel.update((val) {
      val!.name = val.textEditingController.text;
    });
  }

  Future<void> toggleVolume() async {
    homePageModel.update((val) async {
      if (val!.isVolumeOn) {
        await Audio.setAudioOff();
        val.isVolumeOn = false;
        homePageModel();
      } else {
        await Audio.setAudioOn();
        val.isVolumeOn = true;
        homePageModel();
      }
    });
  }
}
