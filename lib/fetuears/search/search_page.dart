import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/cubit/cubit.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:news_sport_app/fetuears/search/widgets/api_List.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.backGroundColor,
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  } else {
                    context.read<NewsCubit>().getBySearch(value);
                  }
                },
                style: getmeduimfont(),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Gap(20),
              const Expanded(child: NewsSearch())
            ],
          ),
        ));
  }
}
