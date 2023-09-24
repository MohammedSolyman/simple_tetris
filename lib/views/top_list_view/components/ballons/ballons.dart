import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Ballons extends StatelessWidget {
  const Ballons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/animated_files/ballons1.json',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
