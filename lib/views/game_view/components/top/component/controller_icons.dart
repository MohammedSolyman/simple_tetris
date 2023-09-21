import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/controllers/grid_controller.dart/controller.dart';
import 'package:simple_tetris/views/game_view/components/dialoges/dialog_exit.dart';

class SoundControl extends StatelessWidget {
  const SoundControl({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return InkWell(onTap: () {
      controller.gridModel.value.isPlaying
          ? controller.pause()
          : controller.resume();
    }, child: Obx(() {
      if (controller.gridModel.value.isPlaying) {
        return Image.asset(
          'assets/in_app_icons/play/red_pause.png',
          height: 40,
          width: 40,
        );
      } else {
        return Image.asset(
          'assets/in_app_icons/play/red_resume.png',
          height: 40,
          width: 40,
        );
      }
    }));
  }
}

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find<Controller>();

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.brown.shade900),
            borderRadius: BorderRadius.circular(20),
            color: Colors.brown.shade300),
        child: Row(
          children: [
            Visibility(
                visible: controller.gridModel.value.isVisibleIcons,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.toggleVolume();
                      },
                      child: Image.asset(
                        controller.gridModel.value.isVolumeOn
                            ? 'assets/in_app_icons/icons/sounds_on.png'
                            : 'assets/in_app_icons/icons/sounds_off.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await dialogExitExitIcon();
                      },
                      child: Image.asset('assets/in_app_icons/icons/exit.png',
                          height: 40, width: 40),
                    )
                  ],
                )),
            InkWell(
              onTap: () {
                controller.toggleIconsVisibility();
              },
              child: Image.asset('assets/in_app_icons/icons/settings.png',
                  height: 40, width: 40),
            ),
          ],
        ),
      );
    });
  }
}

class ControlIcons extends StatelessWidget {
  const ControlIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [SoundControl(), SettingsList()],
    );
  }
}
