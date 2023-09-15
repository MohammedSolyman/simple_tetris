import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/controller.dart';

class Botton extends StatelessWidget {
  const Botton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: const Column(
        children: [
          ThreeButtons(),
          OneButton(),
        ],
      ),
    );
  }
}

class ThreeButtons extends StatelessWidget {
  const ThreeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              controller.moveLeft();
            },
            icon: const Icon(Icons.arrow_back)),
        IconButton(
            onPressed: () {
              controller.rotate();
            },
            icon: const Icon(Icons.rotate_right)),
        IconButton(
            onPressed: () {
              controller.moveRight();
            },
            icon: const Icon(Icons.arrow_forward))
      ],
    );
  }
}

class OneButton extends StatelessWidget {
  const OneButton({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return IconButton(
        onPressed: () {
          controller.moveDown();
        },
        icon: const Icon(Icons.arrow_downward));
  }
}
