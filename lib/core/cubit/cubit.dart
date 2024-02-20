// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_sport_app/core/cubit/cubit_State.dart';
import 'package:news_sport_app/core/services/api_news.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitState());

  getByCategoery(cateegory) {
    emit(NewsLoadingState());
    try {
      ApiServices().getApiNews(cateegory).then((value) {
        emit(NewsSuccessState(model: value!));
      });
    } catch (e) {
      ApiServices().getApiNews(cateegory).then((value) {
        emit(NewsErrorState(error: e.toString()));
      });
    }
  }
  //-------------------------Search-----------------------

  getBySearch(Search) {
    emit(SearchLoadingState());
    try {
      ApiServices().getApiSearch(Search).then((value) {
        emit(SearchSuccessState(model: value!));
      });
    } catch (e) {
      ApiServices().getApiSearch(Search).then((value) {
        emit(SearchErrorState(error: e.toString()));
      });
    }
  }
  //-------------------------------Sources----------------

  getBySourc(source) {
    emit(SourcesNewsLoadingState());
    try {
      ApiServices().getApiSource(source).then((value) {
        emit(SourcesNewsSuccessState(model: value!));
      });
    } catch (e) {
      ApiServices().getApiSource(source).then((value) {
        emit(SourcesNewsErrorState(error: e.toString()));
      });
    }
  }

  //--------------------------------deafult-------------------
  getByCountery() {
    emit(CounterysNewsLoadingState());
    try {
      ApiServices().getApibyCountery().then((value) {
        emit(CounterysNewsSuccessState(model: value!));
      });
    } catch (e) {
      ApiServices().getApibyCountery().then((value) {
        emit(CounterysNewsErrorState(error: e.toString()));
      });
    }
  }
}
