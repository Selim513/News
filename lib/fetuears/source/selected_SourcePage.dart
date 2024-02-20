import 'package:flutter/material.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';

class Selected extends StatelessWidget {
  const Selected({super.key});

  @override
  Widget build(BuildContext context) {
    String source;
    return Scaffold(
      backgroundColor: Appcolors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backGroundColor,
        title: const Text('Source'),
      ),
      body: const Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
          ],
        ),
      )),
    );
  }
}
