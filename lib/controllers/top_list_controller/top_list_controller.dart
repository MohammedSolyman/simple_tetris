import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/constants/my_audio.dart';
import 'package:simple_tetris/data_types/player/player.dart';
import 'package:simple_tetris/models/top_list_model.dart';
import 'package:simple_tetris/services/audio/audio.dart';
import 'package:simple_tetris/services/database/database_helper.dart';

class TopListController extends GetxController {
  Rx<TopListModel> topListModel = TopListModel().obs;

  getData() async {
    DatabaseHelper helper = DatabaseHelper();

    List<Map<String, dynamic>> x = await helper.read();
    List<Player> y = [];

    for (var element in x) {
      Player p = Player.fromMap(element);
      y.add(p);
    }

    topListModel.update((val) {
      val!.data = y;
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await Audio.playAudio(path: MyAudio.topList, isLoop: false);
    getData();
  }

  // @override
  // void dispose() async {
  //   super.dispose();
  //   await Audio.stopAudio();
  //   print('disposed ....................');
  // }

  @override
  InternalFinalCallback<void> get onDelete {
    Audio.stopAudio();
    print('deleted ....................');
    return super.onDelete;
  }
}
