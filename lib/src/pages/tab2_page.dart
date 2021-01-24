import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = Provider.of<NewsService>(context).categories;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: _ListCategories(categories: categories)),
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories({
    Key key,
    @required this.categories
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Icon(categories[index].icon),
              const SizedBox(height: 5.0),
              Text(categories[index].name),
            ],
          ),
        );
      },
    );
  }
}
