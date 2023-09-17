import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tetris/views/splash_sreen_view/splash_screen_view.dart';

/*
git push https://github.com/MohammedSolyman/simple_tetris.git master


*/
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreenView(),
    );
  }
}

// class MyTest extends StatefulWidget {
//   const MyTest({super.key});

//   @override
//   State<MyTest> createState() => _MyTestState();
// }

// class _MyTestState extends State<MyTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () async {
//               Future.delayed(Duration(seconds: 4)).then((value) {
//                 Get.back();
//               });
//               await dialogLineComplete();

//               print('after ----------------------');
//             },
//             child: Text('data')),
//       ),
//     );
//   }
// }
