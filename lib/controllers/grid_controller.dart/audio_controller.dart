import 'package:audioplayers/audioplayers.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/color_controller.dart';

class AudioController extends ColorController {
  AudioPlayer player = AudioPlayer();

  void toggleIconsVisibility() {
    gridModel.update((val) {
      val!.isVisibleIcons = !val.isVisibleIcons;
    });
  }

  Future<void> playAudio(String path) async {
    Source source = AssetSource(path);
    await player.play(source);
  }

  Future<void> toggleVolume() async {
    gridModel.update((val) async {
      if (val!.isVolumeOn) {
        await player.setVolume(0);
        val.isVolumeOn = false;
        toggleIconsVisibility();
      } else {
        await player.setVolume(1);
        val.isVolumeOn = true;
        toggleIconsVisibility();
      }
    });
  }
}
