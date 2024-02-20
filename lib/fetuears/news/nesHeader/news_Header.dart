// ignore_for_file: file_names, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_sport_app/core/services/local_storage.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/fetuears/upload/upload_page.dart';

class news_header extends StatefulWidget {
  const news_header({
    super.key,
  });

  @override
  State<news_header> createState() => _news_headerState();
}

class _news_headerState extends State<news_header> {
  @override
  void initState() {
    super.initState();
    appstoorage.getcahcedData(appstoorage.IMAGE).then((value) {
      setState(() {
        imagePath = value ?? false;
      });
    });
    appstoorage.getcahcedData(appstoorage.NAME).then((value) {
      setState(() {
        name = value ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Hello,",
                  style: getlargefont(color: Appcolors.lemonadaColor)),
              TextSpan(
                  text: name,
                  style: getlargefont(color: Appcolors.lemonadaColor)),
            ])),
            const Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundImage: (imagePath != null)
                  ? FileImage(File(imagePath!)) as ImageProvider
                  : const AssetImage("assets/user.png"),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Have a nice day",
              style: getnormalfont(color: Appcolors.greyColor),
            )
          ],
        )
      ],
    );
  }
}
