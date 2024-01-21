import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/function/route.dart';
import 'package:news_sport_app/core/services/local_storage.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/fetuears/bottomsheet/navigate_bar.dart';
import 'package:news_sport_app/fetuears/upload/upload_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isuploaded = false;
  @override
  void initState() {
    super.initState();
    appstoorage.getcahcedData(appstoorage.Upload).then((value) {
      setState(() {
        isuploaded = value ?? false;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      gotoreplace(context, isuploaded ? const BottomBar() : const uploadPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/splash.png")),
            Text(
              "Insights News",
              style: getlargefont(fontsize: 28, fontweight: FontWeight.w500),
            ),
            const Gap(20),
            Text("Stay Informed, Anytime, Anywhere.",
                style: getmeduimfont(
                  color: Appcolors.greyColor,
                )),
          ],
        ),
      ),
    );
  }
}
