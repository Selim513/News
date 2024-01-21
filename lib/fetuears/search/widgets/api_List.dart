// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/cubit/cubit.dart';
import 'package:news_sport_app/core/cubit/cubit_State.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';

class NewsSearch extends StatelessWidget {
  const NewsSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          var news = state.model;
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Top result : ${news.totalResults}',
                    style: getmeduimfont(),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: news.articles!.length,
                  itemBuilder: (context, index) {
                    var data = news.articles![index];
                    return Container(
                      margin: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: Appcolors.backGroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              data.urlToImage ?? '',
                              fit: BoxFit.cover,
                              width: 150,
                              height: 100,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                decoration: BoxDecoration(
                                    color: Appcolors.backGroundColor),
                                width: 150,
                                height: 100,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                data.title ?? '',
                                style: getsmallfont(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Gap(10),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  Gap(3),
                                  Text('READ',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Search yet",
                style: getlargefont(),
              ),
              const Icon(
                Icons.search_off_sharp,
                size: 40,
                color: Colors.white,
              )
            ],
          ));
        }
      },
    );
  }
}
