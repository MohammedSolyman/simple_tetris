import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/setting_menu/setting_menu.dart';

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

class Info extends StatelessWidget {
  const Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('level: ${controller.gridModel.value.level.level}',
              style: GoogleFonts.croissantOne(fontSize: 20, color: Colors.red)),
          Text('points: ${controller.gridModel.value.points.toString()}',
              style: GoogleFonts.croissantOne(fontSize: 20, color: Colors.red)),
        ],
      );
    });
  }
}
