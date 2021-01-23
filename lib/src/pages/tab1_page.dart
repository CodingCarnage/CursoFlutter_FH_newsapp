import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/widgets/list_news_widget.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: ListNews(
        articles: newsService.headlines,
      ),
    );
  }
}