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
      return Container(
          color: Colors.grey,
          child: Text(controller.gridModel.value.cells.length.toString()));
    });
  }
}
