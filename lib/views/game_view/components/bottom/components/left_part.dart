import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/controllers/my_animation_controller/my_animation_controller.dart';

class LeftPart extends StatelessWidget {
  const LeftPart({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    MyAnimationController animCont = Get.find<MyAnimationController>();

    return Align(
        alignment: Alignment.topRight,
        child: Obx(() {
          return SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: SizedBox(
                width: animCont.model.value.leftButtSize,
                height: animCont.model.value.leftButtSize,
                child: InkWell(
                  onTap: () {
                    animCont.animateLeft();
                    controller.moveLeft();
                  },
                  child: Image.asset('assets/in_app_icons/arrows/left.png',
                      color: animCont.model.value.leftButtCol),
                ),
              ),
            ),
          );
        }));
  }
}
