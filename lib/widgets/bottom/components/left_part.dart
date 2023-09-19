import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';

class LeftPart extends StatelessWidget {
  const LeftPart({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 60,
          height: 60,
          child: InkWell(
            onTap: () {
              controller.moveLeft();
            },
            child: Image.asset(
              'assets/in_app_icons/arrows/red_left.png',
              color: Colors.red,
            ),
          ),
        ));
  }
}
