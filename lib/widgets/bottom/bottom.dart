import 'package:flutter/material.dart';
import 'package:simple_tetris/widgets/bottom/components/left_part.dart';
import 'package:simple_tetris/widgets/bottom/components/middle_part.dart';
import 'package:simple_tetris/widgets/bottom/components/right_part.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade900, width: 6),
          gradient: const LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [LeftPart(), MiddlePart(), RightPart()],
      ),
    );
  }
}
