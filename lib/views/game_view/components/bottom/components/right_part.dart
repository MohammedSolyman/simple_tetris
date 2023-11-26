import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/controllers/my_animation_controller/my_animation_controller.dart';

class RightPart extends StatelessWidget {
  const RightPart({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    MyAnimationController animCont = Get.find<MyAnimationController>();

    return Align(
        alignment: Alignment.topLeft,
        child: Obx(() {
          return SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: SizedBox(
                width: animCont.model.value.rightButtSize,
                height: animCont.model.value.rightButtSize,
                child: InkWell(
                  onTap: () {
                    animCont.animateRight();
                    controller.moveRight();
                  },
                  child: Image.asset('assets/in_app_icons/arrows/right.png',
                      color: animCont.model.value.rightButtCol),
                ),
              ),
            ),
          );
        }));
  }
}
