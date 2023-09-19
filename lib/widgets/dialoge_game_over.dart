import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_tetris/controllers/controller.dart';

Future<dynamic> dialogGameOver() {
  Controller controller = Get.put(Controller());
  return Get.defaultDialog(
      backgroundColor: Colors.grey[200],
      title: '',
      content: Column(
        children: [
          LottieBuilder.asset('assets/animated_files/game_over.json'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    controller.restart();
                    Get.back();
                  },
                  child: Text(
                    'play again',
                    style: GoogleFonts.croissantOne(fontSize: 25),
                  )),
              TextButton(
                  onPressed: () async {
                    await controller.exit();
                  },
                  child: Text('exit',
                      style: GoogleFonts.croissantOne(fontSize: 25)))
            ],
          )
        ],
      ));
}

Future<dynamic> dialogLineComplete() {
  Future.delayed(const Duration(seconds: 4)).then((value) {
    Get.back();
  });

  return Get.dialog(
    LottieBuilder.asset(
      'assets/animated_files/complete_line1.json',
      repeat: false,
    ),
    barrierColor: Colors.transparent,
  );
}

Future<void> dialogLevelCompleted() async {
  Get.defaultDialog(
    title: 'Level completed',
    titleStyle: GoogleFonts.croissantOne(color: Colors.red),
    backgroundColor: Colors.grey[200],
    barrierDismissible: false,
    content: LottieBuilder.asset(
      'assets/animated_files/complete_level3.json',
      repeat: false,
    ),
  );

  await Future.delayed(const Duration(seconds: 4));
  Get.back();
}
