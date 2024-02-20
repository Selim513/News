import 'package:flutter/material.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/fetuears/source/Sources_api.dart';

class Source extends StatelessWidget {
  const Source({super.key});

  @override
  Widget build(BuildContext context) {
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
            SourcesApi(source: 'bbc-news'),
            
          ],
        ),
      )),
    );
  }
}
