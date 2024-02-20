import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/fetuears/news/nesHeader/news_Header.dart';
import 'package:news_sport_app/fetuears/news/widgets/categoery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({
    super.key,
  });

  @override
  State<HomeNews> createState() => _HomeState();
}

class _HomeState extends State<HomeNews> {
  var data;
  int curruntIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Appcolors.backGroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const news_header(),
                  const Gap(10),
                  CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/breaking-news.png",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {
                          setState(() {
                            curruntIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      )),
                  const Gap(10),
                  SmoothPageIndicator(
                    controller: PageController(initialPage: curruntIndex),
                    count: 5,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: Appcolors.greyColor,
                        activeDotColor: Appcolors.lemonadaColor),
                  ),
                  const Gap(10),
                  ButtonsTabBar(
                      contentPadding: const EdgeInsets.all(10),
                      backgroundColor: Appcolors.lemonadaColor,
                      unselectedBackgroundColor: Appcolors.greyColor,
                      buttonMargin: const EdgeInsets.all(5),
                      labelStyle: getsmallfont(),
                      unselectedLabelStyle: getsmallfont(),
                      unselectedBorderColor: Appcolors.greyColor,
                      tabs: [
                        Tab(
                            child: Text(
                          'Science',
                          style: getsmallfont(),
                        )),
                        Tab(
                            child:
                                Text('Entertainment', style: getsmallfont())),
                        Tab(child: Text('Sport', style: getsmallfont())),
                        Tab(child: Text('Business', style: getsmallfont())),
                      ]),
                  const Gap(10),
                  const Expanded(
                    child: TabBarView(children: [
                      NewsScience(
                        category: 'Science',
                      ),
                      NewsScience(
                        category: 'Entertainment',
                      ),
                      NewsScience(
                        category: 'Sports',
                      ),
                      NewsScience(
                        category: 'Business',
                      ),
                    ]),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
