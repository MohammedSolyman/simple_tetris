import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/widgets/setting_menu/setting_menu.dart';
import 'package:simple_tetris/widgets/top/component/info.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade900, width: 6),
          gradient: const LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Info(), TwoIcons()],
      ),
    );
  }
}

class TwoIcons extends StatelessWidget {
  const TwoIcons({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: InkWell(
                onTap: () {
                  controller.gridModel.value.isPlaying
                      ? controller.pause()
                      : controller.resume();
                },
                child: controller.gridModel.value.isPlaying
                    ? Image.asset('assets/in_app_icons/play/red_pause.png')
                    : Image.asset('assets/in_app_icons/play/red_resume.png')),
          ),
          const SettingsButton(40, 40)
        ],
      );
    });
  }
}
