import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade900, width: 6),
          gradient: const LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [LeftPart(), MiddlePart(), RightPart()],
      ),
    );
  }
}

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
              'assets/in_app_icons/arrows/red_down.png',
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
