import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class BlurredBackGround extends StatelessWidget {
  const BlurredBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 0.3,
      blurColor: Colors.blue,
      colorOpacity: 0.7,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/top_list/top_list_image.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
