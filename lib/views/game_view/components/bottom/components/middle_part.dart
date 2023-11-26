import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/controllers/my_animation_controller/my_animation_controller.dart';

class MiddlePart extends StatelessWidget {
  const MiddlePart({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    MyAnimationController animCont = Get.find<MyAnimationController>();

    return Obx(() {
      return Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: SizedBox(
                width: animCont.model.value.rightButtSize,
                height: animCont.model.value.rightButtSize,
                child: InkWell(
                  onTap: () {
                    animCont.animateRotate();
                    controller.rotate();
                  },
                  child: Image.asset(
                    'assets/in_app_icons/arrows/rotate.png',
                    color: animCont.model.value.rotateButtCol,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: SizedBox(
                width: animCont.model.value.downButtSize,
                height: animCont.model.value.downButtSize,
                child: InkWell(
                  onTap: () {
                    animCont.animateDown();

                    controller.moveDown();
                  },
                  child: Image.asset(
                    'assets/in_app_icons/arrows/down.png',
                    color: animCont.model.value.downButtCol,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
