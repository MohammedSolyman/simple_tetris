import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/controllers/controller.dart';
import 'package:simple_tetris/widgets/setting_button/setting_button.dart';

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
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: InkWell(
              child: Image.asset('assets/in_app_icons/play/red_pause.png')),
        ),
        const SettingsButton(40, 40)
      ],
    );
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
