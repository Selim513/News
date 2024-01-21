// ignore_for_file: file_names

import 'package:news_sport_app/core/news_model/news_model.dart';

class NewsState {}

class NewsInitState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final NewsModel model;

  NewsSuccessState({required this.model});
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState({required this.error});
}
//----------------------Search---------------------------
class SearchInitState extends NewsState {}

class SearchLoadingState extends NewsState {}

class SearchSuccessState extends NewsState {
  final NewsModel model;

  SearchSuccessState({required this.model});
}

class SearchErrorState extends NewsState {
  final String error;

  SearchErrorState({required this.error});
}
//------------------------Sources---------------------------
class SourcesNewsInitState extends NewsState {}

class SourcesNewsLoadingState extends NewsState {}

class SourcesNewsSuccessState extends NewsState {
  final NewsModel model;

  SourcesNewsSuccessState({required this.model});
}

class SourcesNewsErrorState extends NewsState {
  final String error;

  SourcesNewsErrorState({required this.error});
}
