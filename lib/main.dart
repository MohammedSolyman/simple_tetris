import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/views/splash_screen_view/splash_screen_view.dart';

/*
git push https://github.com/MohammedSolyman/simple_tetris.git master
*/
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
    );
  }
}
