import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/fetuears/upload/upload_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: (imagePath != null)
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage("assets/user.png"),
                ),
                Positioned(
                    right: 30,
                    bottom: 5,
                    child: CircleAvatar(
                      backgroundColor: Appcolors.backGroundColor,
                      minRadius: 5.1,
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                    ))
              ],
            ),
            const Gap(50),
            Divider(
              indent: 1,
              endIndent: 1,
              color: Appcolors.lemonadaColor,
            ),
            const Gap(50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      name,
                      style: getlargefont(color: Appcolors.lemonadaColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
