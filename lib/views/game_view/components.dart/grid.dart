import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/cell_template/cell_template.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    return Expanded(child: LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;

        double childAspectRatio =
            (width / controller.gridModel.value.level.columnsLength) /
                (height / controller.gridModel.value.level.rowsLength);

        return Obx(() {
          return GridView.builder(
              padding: const EdgeInsets.all(0),
              //  physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      controller.gridModel.value.level.columnsLength,
                  childAspectRatio: childAspectRatio),
              itemCount: controller.gridModel.value.level.columnsLength *
                  controller.gridModel.value.level.rowsLength,
              itemBuilder: (BuildContext context, int index) {
                return CellTemplate(
                  index,
                  color: controller.gridModel.value.cells[index].color!,
                );
              });
        });
      },
    ));
  }
}
