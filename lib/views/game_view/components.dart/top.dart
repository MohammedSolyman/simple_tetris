import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';

class Top extends StatelessWidget {
  const Top({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('level: ${controller.gridModel.value.level.level}'),
            Text('points: ${controller.gridModel.value.points.toString()}'),
          ],
        ),
      );
    });
  }
}
