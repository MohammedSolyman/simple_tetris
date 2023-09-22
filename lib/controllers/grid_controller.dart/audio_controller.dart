import 'package:simple_tetris/controllers/grid_controller.dart/color_controller.dart';
import 'package:simple_tetris/services/audio/audio.dart';

class AudioController extends ColorController {
  // AudioPlayer player = AudioPlayer();

  void toggleIconsVisibility() {
    gridModel.update((val) {
      val!.isVisibleIcons = !val.isVisibleIcons;
    });
  }

  Future<void> toggleVolume() async {
    gridModel.update((val) async {
      if (val!.isVolumeOn) {
        await Audio.setAudioOff();
        val.isVolumeOn = false;
        toggleIconsVisibility();
      } else {
        await Audio.setAudioOn();
        val.isVolumeOn = true;
        toggleIconsVisibility();
      }
    });
  }
}
