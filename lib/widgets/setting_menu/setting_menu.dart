import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/views/top_list_view.dart';

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
            // DatabaseHelper helper = DatabaseHelper();
            // await helper.read();
          },
          child: Image.asset('assets/in_app_icons/icons/settings.png')),
    );
  }
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) {
          if (value == 1) {
          } else {
            Get.to(() => const TopListView());
          }
        },
        color: Colors.yellow.withOpacity(0.7),
        elevation: 20,
        constraints: const BoxConstraints(maxWidth: 180),
        position: PopupMenuPosition.under,
        offset: const Offset(0, -25),
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 4, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: AvatarGlow(
          endRadius: 60,
          child: Image.asset('assets/in_app_icons/icons/settings.png'),
        ),
        itemBuilder: (contex) {
          List<PopupMenuEntry<dynamic>> x = [
            PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/in_app_icons/icons/sounds_off.png',
                      height: 40,
                    ),
                    const Text('sound off')
                  ],
                )),
            PopupMenuItem(
                value: 2,
                // onTap: () {
                //   //    Get.back();
                // //  Get.to(() => const TopListView());
                //   // DatabaseHelper helper = DatabaseHelper();
                //   // await helper.read();
                // },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/in_app_icons/icons/toplist1.png',
                      height: 30,
                    ),
                    const Text('top list')
                  ],
                )),
          ];
          return x;
        });
  }
}
