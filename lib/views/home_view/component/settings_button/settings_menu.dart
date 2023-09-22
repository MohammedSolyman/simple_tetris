import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/home_page_controller/home_page_controller.dart';
import 'package:simple_tetris/views/top_list_view/top_list_view.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HompePageController controller = Get.put(HompePageController());

    return PopupMenuButton(
        onSelected: (value) {
          if (value == 1) {
            controller.toggleVolume();
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      controller.homePageModel.value.isVolumeOn
                          ? 'assets/in_app_icons/icons/sounds_on.png'
                          : 'assets/in_app_icons/icons/sounds_off.png',
                      height: 30,
                      width: 40,
                    ),
                    Text(controller.homePageModel.value.isVolumeOn
                        ? 'sound on'
                        : 'sound off')
                  ],
                )),
            PopupMenuItem(
                value: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/in_app_icons/icons/toplist1.png',
                      height: 30,
                      width: 40,
                    ),
                    const Text('top list')
                  ],
                )),
          ];
          return x;
        });
  }
}
