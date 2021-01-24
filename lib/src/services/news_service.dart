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
  
  String _selectedCategory = 'business';

  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService () {
    this.getTopHeadlines();

    categories.forEach((item) { 
      this.categoryArticles[item.name] = new List();
    });

    this.getArticlesByCategory( this._selectedCategory );
  }

  bool get isLoading => this._isLoading;

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String value) {
    this._selectedCategory = value;
    this._isLoading = true;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get articleFromSelectedCategory => this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async {
    final String url = '$_URL_NEWSAPI/top-headlines?apiKey=$_APIKEY&country=mx';
    final http.Response response = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(response.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      this._isLoading = false;
      notifyListeners();
      return this.categoryArticles[category];
    }
    
    final String url = '$_URL_NEWSAPI/top-headlines?apiKey=$_APIKEY&category=$category&country=mx';
    final http.Response response = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(response.body);

    this.categoryArticles[category].addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }
}