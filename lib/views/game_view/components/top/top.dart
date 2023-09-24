import 'package:flutter/material.dart';
import 'package:simple_tetris/views/game_view/components/top/component/controller_icons.dart';
import 'package:simple_tetris/views/game_view/components/top/component/info.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple.shade900, width: 6),
          gradient: const LinearGradient(colors: [
            Colors.purple,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Info(), ControlIcons()],
      ),
    );
  }
}
