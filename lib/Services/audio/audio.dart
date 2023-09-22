import 'package:audioplayers/audioplayers.dart';

class Audio {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playAudio(
      {required String path, required bool isLoop}) async {
    Source source = AssetSource(path);
    await _player.play(source);

    if (isLoop) {
      _player.onPlayerComplete.listen((event) async {
        await _player.play(source);
      });
    }
  }

  static Future<void> setAudioOn() async {
    await _player.setVolume(1);
  }

  static Future<void> setAudioOff() async {
    await _player.setVolume(0);
  }

  static Future<void> stopAudio() async {
    await _player.stop();
  }
}
