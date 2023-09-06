import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/views/game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Game(),
    );
  }
}
