import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
