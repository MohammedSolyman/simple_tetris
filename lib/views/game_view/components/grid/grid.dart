import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/views/game_view/components/cell_template/cell_template.dart';

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
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple.shade900, width: 6),
            ),
            child: GridView.builder(
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
                    color: controller.gridModel.value.cells[index].color!,
                  );
                }),
          );
        });
      },
    ));
  }
}
