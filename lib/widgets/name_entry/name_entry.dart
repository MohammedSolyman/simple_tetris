import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/controllers/home_page_controller.dart';

class NameEntry extends StatelessWidget {
  NameEntry({
    super.key,
  });

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    HompePageController hompePageController = Get.put(HompePageController());
    return Row(
      children: [
        Expanded(
            child: Form(
          key: globalKey,
          child: TextFormField(
            controller:
                hompePageController.homePageModel.value.textEditingController,
            autovalidateMode: AutovalidateMode.always,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'enter your name here';
              } else {
                return null;
              }
            },
            cursorColor: Colors.red,
            cursorHeight: 30,
            cursorWidth: 5,
            style: GoogleFonts.croissantOne(color: Colors.red),
            decoration: InputDecoration(
              label: Text(
                'your name',
                style: GoogleFonts.croissantOne(color: Colors.red),
              ),
              fillColor: Colors.yellow[500]!.withOpacity(0.5),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 6, color: Colors.yellow)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 6, color: Colors.yellow)),
            ),
          ),
        )),
        AvatarGlow(
          endRadius: 60,
          child: InkWell(
              onTap: () {
                FormState? formState = globalKey.currentState;
                if (formState!.validate()) {
                  hompePageController.goToGame(hompePageController.getName());
                }
              },
              child: Image.asset(
                'assets/in_app_icons/play/blue_play.png',
                color: Colors.yellow,
              )),
        ),
      ],
    );
  }
}
