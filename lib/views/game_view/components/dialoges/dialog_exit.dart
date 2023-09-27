import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';

Future<void> dialogExitExitIcon() async {
  //this function will be called if the user clicks on exit icon.
  //first, this function pauses the game,
  //if the user clicks 'resume', it pops this dialogue and resumes the game.
  //if the user clicks 'exit', it adds the score to database and exit the app.

  Controller controller = Get.put(Controller());
  controller.pause();
  await Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: Colors.grey[200],
      title: '',
      content: Column(
        children: [
          LottieBuilder.asset('assets/animated_files/exit.json'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    controller.resume();
                    Get.back();
                  },
                  child: Text(
                    'resume',
                    style: GoogleFonts.croissantOne(fontSize: 25),
                  )),
              TextButton(
                  onPressed: () async {
                    await controller.saveScore();
                    controller.exitApp();
                  },
                  child: Text('exit',
                      style: GoogleFonts.croissantOne(fontSize: 25)))
            ],
          )
        ],
      ));
}

Future<bool> dialogExitBackArrow() async {
  //this function will be called if the user clicks on system back arrow.
  //first, this function pauses the game,
  //if the user clicks 'resume', it pops this dialogue and resumes the game, and
  //returns Future<false> to WillPopScope to not exit the application.
  //if the user clicks 'exit', it adds the score to database ,and
  //returns Future<true> to WillPopScope to exit the application.
  Controller controller = Get.put(Controller());
  controller.pause();
  return await Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: Colors.grey[200],
          title: '',
          content: Column(
            children: [
              LottieBuilder.asset('assets/animated_files/exit.json'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.resume();
                        return Get.back(result: false);
                      },
                      child: Text(
                        'resume',
                        style: GoogleFonts.croissantOne(fontSize: 25),
                      )),
                  TextButton(
                      onPressed: () async {
                        //exit full screen mode.
                        SystemChrome.setEnabledSystemUIMode(
                            SystemUiMode.edgeToEdge);

                        await controller.saveScore();
                        return Get.back(result: true);
                      },
                      child: Text('exit',
                          style: GoogleFonts.croissantOne(fontSize: 25)))
                ],
              )
            ],
          )) ??
      false;
}
