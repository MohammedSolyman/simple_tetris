import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_tetris/controllers/top_list_controller/top_list_controller.dart';
import 'package:simple_tetris/data_types/player/player.dart';
import 'package:simple_tetris/views/top_list_view/components/top_list_body/components/top_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TopListController controller = Get.find<TopListController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/in_app_icons/icons/star.png'))),
            ),
            LottieBuilder.asset(
              'assets/animated_files/top_list_tetris.json',
              repeat: true,
              height: 70,
              width: 70,
            ),
            LottieBuilder.asset(
              'assets/animated_files/date.json',
              repeat: true,
              height: 50,
              width: 50,
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: controller.topListModel.value.data!.length,
            itemBuilder: (context, index) {
              List<Player>? data = controller.topListModel.value.data;

              return TopListTile(
                index: index,
                player: data![index],
              );
            }),
      ],
    );
  }
}
