import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/cell_template.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Scaffold(body: Obx(() {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10),
          itemCount: controller.gridModel.value.columnsLength *
              controller.gridModel.value.rowsLength,
          itemBuilder: (BuildContext context, int index) {
            return CellTemplate(
              index,
              color: controller.gridModel.value.cells[index].color!,
            );
          });
    }));
  }
}
