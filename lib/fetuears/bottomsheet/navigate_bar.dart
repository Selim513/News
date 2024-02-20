import 'package:flutter/material.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/fetuears/news/home.dart';
import 'package:news_sport_app/fetuears/profile/profile_page.dart';
import 'package:news_sport_app/fetuears/search/search_page.dart';
import 'package:news_sport_app/fetuears/source/source_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentindex = 0;
  List<Widget> selected = [
    const HomeNews(),
    const Search(),
    const Source(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selected[currentindex],
      backgroundColor: Appcolors.backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Appcolors.backGroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Appcolors.lemonadaColor,
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          unselectedIconTheme: IconThemeData(color: Appcolors.greyColor),
          selectedLabelStyle: const TextStyle(color: Colors.red),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HomeNews"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.source), label: "Source"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
