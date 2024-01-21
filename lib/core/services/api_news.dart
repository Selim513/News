// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_sport_app/core/news_model/news_model.dart';

class ApiServices {
  Future<NewsModel?> getApiNews(category) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=50c83a6d24414491898bf8e6a6dc4660#');
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
          'https://newsapi.org/v2/top-headlines?q=$Search&apiKey=50c83a6d24414491898bf8e6a6dc4660#');
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
  Future<NewsModel?> getApiSource(Source) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?sources=$Source&apiKey=50c83a6d24414491898bf8e6a6dc4660#');
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
