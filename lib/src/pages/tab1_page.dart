import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/widgets/list_news_widget.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key key}) : super(key: key);

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.headlines.length == 0)
          ? Center(child: CircularProgressIndicator())
          : ListNews(articles: newsService.headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
