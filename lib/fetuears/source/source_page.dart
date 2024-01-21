import 'package:flutter/material.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/splash_screen.dart';

class Source extends StatefulWidget {
  const Source({super.key});

  @override
  State<Source> createState() => _SourceState();
}

class _SourceState extends State<Source> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Appcolors.backGroundColor,
          title: const Text('Source'),
        ),
        body: const Splashscreen());
  }
}
