import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_tetris/views/top_list_view/components/ballons/ballons.dart';
import 'package:simple_tetris/views/top_list_view/components/blurred_back_ground/blurred_back_ground.dart';
import 'package:simple_tetris/views/top_list_view/components/top_list_body/top_list_body.dart';

class TopListView extends StatelessWidget {
  const TopListView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return const Scaffold(
      body: Stack(
        children: [BlurredBackGround(), TopListBody(), Ballons()],
      ),
    );
  }
}
