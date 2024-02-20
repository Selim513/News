import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_sport_app/core/services/local_storage.dart';
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
  void initState() {
    super.initState();
    isVisvile = false;
  }

  bool isVisvile = true;
  var editName = TextEditingController();
  final FocusNode keyboard = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          isVisvile
              ? TextButton(
                  onPressed: () {
                    appstoorage.cachedData(appstoorage.IMAGE, imagePath);
                    isVisvile = false;
                    setState(() {});
                  },
                  child: Text(
                    'Save Changes',
                    style: getmeduimfont(color: Colors.blue),
                  ))
              : Container(),
        ]),
        backgroundColor: Appcolors.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: SingleChildScrollView(
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
                        right: 5,
                        bottom: 5,
                        child: CircleAvatar(
                          backgroundColor: Appcolors.backGroundColor,
                          radius: 25,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Appcolors.backGroundColor,
                                    title: Text(
                                      'Edit your image',
                                      textAlign: TextAlign.center,
                                      style: getlargefont(
                                          color: Appcolors.lemonadaColor),
                                    ),
                                    content: Container(
                                      padding: const EdgeInsets.only(top: 15),
                                      decoration: const BoxDecoration(),
                                      height: 150,
                                      width: 300,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    backgroundColor:
                                                        Appcolors.lemonadaColor,
                                                    foregroundColor:
                                                        Colors.black),
                                                onPressed: () {
                                                  uploadFromCamera();
                                                  isVisvile = true;
                                                  Navigator.of(context).pop();
                                                },
                                                child:
                                                    const Text("From Camera")),
                                          ),
                                          const Gap(15),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    backgroundColor:
                                                        Appcolors.lemonadaColor,
                                                    foregroundColor:
                                                        Colors.black),
                                                onPressed: () {
                                                  uploadFromGallery();
                                                  isVisvile = true;
                                                  Navigator.of(context).pop();
                                                },
                                                child:
                                                    const Text("From Gallery")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                              size: 30,
                            ),
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
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: getlargefont(color: Appcolors.lemonadaColor),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Container(
                                  color: Appcolors.backGroundColor,
                                  height: 150,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: editName,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              hintText: 'Edit your name',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                        const Gap(20),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape:
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                backgroundColor:
                                                    Appcolors.lemonadaColor,
                                                foregroundColor: Colors.black),
                                            onPressed: () {
                                              name = editName.text;
                                              appstoorage.cachedData(
                                                  appstoorage.NAME, editName);
                                              setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Confirm'))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.edit,
                                size: 25, color: Appcolors.lemonadaColor),
                            const Gap(1),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: Appcolors.lemonadaColor,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
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
