// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_sport_app/core/news_model/news_model.dart';

class ApiServices {
  Future<NewsModel?> getApiNews(category) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=4cc0f2d94c2f4192bb3bd972dd1140ca');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        NewsModel posts = NewsModel.fromJson(data);
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

//-----------------------------------Search------------------------------------
  Future<NewsModel?> getApiSearch(Search) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?q=$Search&apiKey=4cc0f2d94c2f4192bb3bd972dd1140ca');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        NewsModel posts = NewsModel.fromJson(data);
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //-----------------------------------Source------------------------------------
  Future<NewsModel?> getApiSource(source) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?sources=$source&apiKey=4cc0f2d94c2f4192bb3bd972dd1140ca');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        NewsModel posts = NewsModel.fromJson(data);
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
