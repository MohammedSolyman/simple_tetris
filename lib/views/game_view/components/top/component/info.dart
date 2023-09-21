import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';

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
