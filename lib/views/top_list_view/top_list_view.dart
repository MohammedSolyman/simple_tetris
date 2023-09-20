import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_tetris/controllers/top_list_controller/top_list_controller.dart';
import 'package:simple_tetris/data_types/player/player.dart';
import 'package:simple_tetris/views/top_list_view/components/top_list_tile.dart';
import 'package:blur/blur.dart';

class TopListView extends StatelessWidget {
  const TopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [BlurredBackGround(), TopListBody(), Ballons()],
      ),
    );
  }
}

class BlurredBackGround extends StatelessWidget {
  const BlurredBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 0.3,
      blurColor: Colors.blue,
      colorOpacity: 0.5,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/top_list/top_list_image1.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}

class Ballons extends StatelessWidget {
  const Ballons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/animated_files/ballons1.json',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}

class TopListBody extends StatelessWidget {
  const TopListBody({super.key});

  @override
  Widget build(BuildContext context) {
    TopListController controller = Get.put(TopListController());

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Obx(() {
          if (controller.topListModel.value.data == null) {
            return const MyImage();
          } else {
            return const MyListView();
          }
        }),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/in_app_icons/icons/toplist2.png');
  }
}

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TopListController controller = Get.find<TopListController>();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.topListModel.value.data!.length,
        itemBuilder: (context, index) {
          List<Player>? data = controller.topListModel.value.data;

          return TopListTile(
            index: index,
            player: data![index],
          );
        });
  }
}
