import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/views/game_view.dart';
import 'package:simple_tetris/widgets/setting_button/setting_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/home6.png'),
                      fit: BoxFit.cover)),
            ),
            const Positioned(
              top: 15,
              right: 0,
              child: AvatarGlow(
                endRadius: 60,
                child: SettingsButton(100, 100),
              ),
            ),
            Positioned(
              top: 15,
              left: 0,
              child: AvatarGlow(
                endRadius: 60,
                child: InkWell(
                    child: SizedBox(
                        height: 75,
                        child: Image.asset(
                            'assets/in_app_icons/icons/toplist2.png'))),
              ),
            ),
            Positioned(
                bottom: 5,
                left: 50,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: LinearGradient(colors: [
                        Colors.red.withOpacity(0.5),
                        Colors.purple.withOpacity(0.5),
                        Colors.blue.withOpacity(0.5),
                      ])),
                  child: Row(
                    children: [
                      AvatarGlow(
                          endRadius: 60,
                          child: InkWell(
                              onTap: () {
                                Get.to(const GameView());
                              },
                              child: Image.asset(
                                'assets/in_app_icons/play/blue_play.png',
                                color: Colors.amber,
                              ))),
                      AvatarGlow(
                        endRadius: 60,
                        child: Text(
                          'start',
                          style: GoogleFonts.croissantOne(
                              fontSize: 30, color: Colors.amber),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
