import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:newsapp/src/models/category_model.dart';
export 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

const _URL_NEWSAPI = 'https://newsapi.org/v2';
const _APIKEY = '9e775723f8ce4846b31548faac0703b1';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

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