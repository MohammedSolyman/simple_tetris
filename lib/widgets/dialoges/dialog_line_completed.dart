import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> dialogLineCompleted() {
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
