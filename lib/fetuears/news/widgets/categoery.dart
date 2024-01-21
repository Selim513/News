import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/cubit/cubit.dart';
import 'package:news_sport_app/core/cubit/cubit_State.dart';
import 'package:news_sport_app/core/function/route.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/fetuears/news/news_Detials.dart';

class NewsScience extends StatelessWidget {
  final String category;
  const NewsScience({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getByCategoery(category);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsSuccessState) {
          var news = state.model;
          return ListView.builder(
            itemCount: news.articles!.length,
            itemBuilder: (context, index) {
              var data = news.articles![index];
              return GestureDetector(
                onTap: () {
                  gotopush(context, Details(model: data));
                },
                child: Container(
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
                            decoration:
                                BoxDecoration(color: Appcolors.backGroundColor),
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
                ),
              );
            },
          );
        } else if (state is NewsErrorState) {
          return const Text('Error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
