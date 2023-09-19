import 'package:flutter/material.dart';
import 'package:simple_tetris/Services/database/database_helper.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton(this.width, this.height, {super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
          onTap: () async {
            DatabaseHelper helper = DatabaseHelper();
            await helper.read();
          },
          child: Image.asset('assets/in_app_icons/icons/settings.png')),
    );
  }
}
