import 'package:audioplayers/audioplayers.dart';
import 'package:simple_tetris/controllers/color_controller.dart';

class AudioController extends ColorController {
  AudioPlayer player = AudioPlayer();

  playAudio(String path) async {
    Source source = AssetSource(path);
    await player.play(source);
  }
}
