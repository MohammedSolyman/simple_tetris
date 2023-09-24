import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';

class MiddlePart extends StatelessWidget {
  const MiddlePart({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: InkWell(
            onTap: () {
              controller.rotate();
            },
            child: Image.asset(
              'assets/in_app_icons/arrows/rotate.png',
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 60,
          child: InkWell(
            onTap: () {
              controller.moveDown();
            },
            child: Image.asset(
              'assets/in_app_icons/arrows/down.png',
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
