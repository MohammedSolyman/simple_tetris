import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/cell_template.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    return Expanded(
      child: Obx(() {
        return GridView.builder(
            padding: const EdgeInsets.all(0),
            //  physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
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
      }),
    );
  }
}
