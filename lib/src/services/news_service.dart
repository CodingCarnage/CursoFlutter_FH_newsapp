import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/news_models.dart';

final _URL_NEWSAPI = 'https://newsapi.org/v2';
final _APIKEY = '9e775723f8ce4846b31548faac0703b1';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService () {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final String url = '$_URL_NEWSAPI/top-headlines?apiKey=$_APIKEY&country=mx';
    final http.Response response = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(response.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}