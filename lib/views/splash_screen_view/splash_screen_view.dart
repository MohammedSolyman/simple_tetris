import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_tetris/views/home_view/home_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.purple])),
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: LottieBuilder(
              lottie: AssetLottie('assets/animated_files/splash_screen.json'),
              controller: animationController,
              onLoaded: (p0) async {
                animationController.duration = p0.duration;
                await animationController.forward();
                Get.off(const HomeView());
              },
            ),
          ),
        ),
      ),
    );
  }
}
