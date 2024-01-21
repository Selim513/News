// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_sport_app/core/function/route.dart';
import 'package:news_sport_app/core/services/local_storage.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/core/widgets/snakeBar.dart';
import 'package:news_sport_app/fetuears/news/home.dart';

String? imagePath;
String name = "";

class uploadPage extends StatefulWidget {
  const uploadPage({super.key});

  @override
  State<uploadPage> createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backGroundColor,
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  appstoorage.cachedData(appstoorage.Upload, true);
                  appstoorage.cachedData(appstoorage.NAME, name);
                  appstoorage.cachedData(appstoorage.IMAGE, imagePath);
                  gotoreplace(context, const HomeNews());
                } else if (imagePath != null && name.isEmpty) {
                  ErrorSnakePar(context, "You Should Enter your name");
                } else if (imagePath == null && name.isNotEmpty) {
                  ErrorSnakePar(context, "You Should Set A photo");
                } else {
                  ErrorSnakePar(
                      context, "Your Should fill your name and image Firsy");
                }
              },
              child: Text(
                "Done",
                style: getsmallfont(color: Appcolors.lemonadaColor),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 100,
              backgroundImage: (imagePath != null)
                  ? FileImage(File(imagePath!)) as ImageProvider
                  : const AssetImage("assets/user.png"),
            ),
            const Gap(30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Appcolors.buttonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      uploadFromCamera();
                    });
                  },
                  child: Text(
                    "photo from Camera",
                    style: getmeduimfont(),
                  )),
            ),
            const Gap(20),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Appcolors.buttonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      uploadFromGallery();
                    });
                  },
                  child: Text(
                    "photo from Gallery",
                    style: getmeduimfont(),
                  )),
            ),
            const Gap(20),
            Divider(
              color: Appcolors.lemonadaColor,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: getmeduimfont(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                    hintText: "Enter your name"),
              ),
            )
          ],
        ),
      ),
    );
  }

  uploadFromCamera() async {
    final imagepicked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagepicked != null) {
      setState(() {
        imagePath = imagepicked.path;
      });
    }
  }

  uploadFromGallery() async {
    final imagepicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagepicked != null) {
      setState(() {
        imagePath = imagepicked.path;
      });
    }
  }
}
