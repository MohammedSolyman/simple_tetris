import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';

class RightPart extends StatelessWidget {
  const RightPart({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 60,
          height: 60,
          child: InkWell(
            onTap: () {
              controller.moveRight();
            },
            child: Image.asset(
              'assets/in_app_icons/arrows/red_right.png',
              color: Colors.red,
            ),
          ),
        ));
  }
}
