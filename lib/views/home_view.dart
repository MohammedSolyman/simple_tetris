import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/controllers/home_page_controller.dart';
import 'package:simple_tetris/widgets/setting_button/setting_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

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
    HompePageController hompePageController = Get.put(HompePageController());

    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home7.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // AvatarGlow(
                //   endRadius: 60,
                //   child: InkWell(
                //       child: SizedBox(
                //           height: 75,
                //           child: Image.asset(
                //               'assets/in_app_icons/icons/toplist2.png'))),
                // ),
                const AvatarGlow(
                  endRadius: 60,
                  child: SettingsButton(100, 100),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Form(
                      key: globalKey,
                      child: TextFormField(
                        controller: hompePageController
                            .homePageModel.value.textEditingController,
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
                              borderSide: const BorderSide(
                                  width: 6, color: Colors.yellow)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 6, color: Colors.yellow)),
                        ),
                      ),
                    )),
                    AvatarGlow(
                      endRadius: 60,
                      child: InkWell(
                          onTap: () {
                            FormState? formState = globalKey.currentState;
                            if (formState!.validate()) {
                              hompePageController
                                  .goToGame(hompePageController.getName());
                            }
                          },
                          child: Image.asset(
                            'assets/in_app_icons/play/blue_play.png',
                            color: Colors.yellow,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
