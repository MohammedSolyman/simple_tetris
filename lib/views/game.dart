import 'package:flutter/material.dart';
import 'package:simple_tetris/views/game_view/components.dart/botton.dart';
import 'package:simple_tetris/views/game_view/components.dart/grid.dart';
import 'package:simple_tetris/views/game_view/components.dart/top.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller controller = Get.find<Controller>();

    return const Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          children: [
            Top(),
            Grid(),
            Botton(),
          ],
        ));
  }
}

// class Botton extends StatelessWidget {
//   const Botton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Controller controller = Get.find<Controller>();

//     return Container(
//       color: Colors.grey,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//               onPressed: () {
//                 controller.moveLeft();
//               },
//               icon: const Icon(Icons.arrow_back)),
//           IconButton(
//               onPressed: () {
//                 controller.rotate();
//               },
//               icon: const Icon(Icons.rotate_right)),
//           IconButton(
//               onPressed: () {
//                 controller.moveRight();
//               },
//               icon: const Icon(Icons.arrow_forward))
//         ],
//       ),
//     );
//   }
// }

// class Top extends StatelessWidget {
//   const Top({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Controller controller = Get.find<Controller>();

//     return Obx(() {
//       return Container(
//           color: Colors.grey,
//           child: Text(controller.gridModel.value.cells.length.toString()));
//     });
//   }
// }

// class Grid extends StatelessWidget {
//   const Grid({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Controller controller = Get.find<Controller>();
//     return Expanded(
//       child: Obx(() {
//         return GridView.builder(
//             padding: const EdgeInsets.all(0),
//             //  physics: const NeverScrollableScrollPhysics(),
//             // shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 10),
//             itemCount: controller.gridModel.value.columnsLength *
//                 controller.gridModel.value.rowsLength,
//             itemBuilder: (BuildContext context, int index) {
//               return CellTemplate(
//                 index,
//                 color: controller.gridModel.value.cells[index].color!,
//               );
//             });
//       }),
//     );
//   }
// }
