// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/cubit/cubit.dart';
import 'package:news_sport_app/core/cubit/cubit_State.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';

class SourcesApi extends StatelessWidget {
  
  const SourcesApi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getBySourc(context);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is SourcesNewsSuccessState) {
          var news = state.model;
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                var data = news.articles![index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      margin: const EdgeInsets.only(top: 20, right: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              data.urlToImage ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Gap(10),
                          Text('${data.source!.name}')
                        ],
                      )),
                );
              },
            ),
          );
        } else if (state is SourcesNewsLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error !',
                style: getlargefont(),
              ),
            ],
          ));
        }
      },
    );
  }
}
