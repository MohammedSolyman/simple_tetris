import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_tetris/views/home_view/component/name_entry/name_entry.dart';
import 'package:simple_tetris/views/home_view/component/settings_button/settings_menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/home/home.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.purple],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
            const Positioned(top: 0, right: 0, child: SettingsMenu()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const NameEntry(),
                ),
              ],
            )
          ],
        ));
  }
}
