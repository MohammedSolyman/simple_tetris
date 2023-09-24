import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/top_list_controller/top_list_controller.dart';
import 'package:simple_tetris/views/top_list_view/components/top_list_body/components/my_image.dart';
import 'package:simple_tetris/views/top_list_view/components/top_list_body/components/my_list_view.dart';

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
