import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';

class ListNews extends StatelessWidget {
  const ListNews({Key key, @required this.articles}) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(this.articles[index].title);
      },
    );
  }
}
