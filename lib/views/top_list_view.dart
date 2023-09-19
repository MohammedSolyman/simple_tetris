import 'package:flutter/material.dart';

class TopListView extends StatelessWidget {
  const TopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/top_list/top_list_image1.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
