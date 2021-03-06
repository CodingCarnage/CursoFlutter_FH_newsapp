import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/theme/dark_theme.dart';

import 'package:newsapp/src/widgets/list_news_widget.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListCategories(),
            if (!newsService.isLoading)
              Expanded(
                child: ListNews(
                  articles: newsService.articleFromSelectedCategory,
                ),
              ),
            if (newsService.isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Category> categories =
        Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _CategoryButton(category: categories[index]),
                const SizedBox(height: 5.0),
                Text(
                    '${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final NewsService newsService =
            Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory != category.name)
              ? Colors.black54
              : darkTheme.accentColor,
        ),
      ),
    );
  }
}
