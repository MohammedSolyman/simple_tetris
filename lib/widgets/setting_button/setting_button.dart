import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton(this.width, this.height, {super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child:
          InkWell(child: Image.asset('assets/in_app_icons/icons/settings.png')),
    );
  }
}
