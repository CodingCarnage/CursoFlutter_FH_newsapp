import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';

import 'package:newsapp/src/theme/dark_theme.dart';

class ListNews extends StatelessWidget {
  const ListNews({Key key, @required this.articles}) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.articles.length,
      itemBuilder: (BuildContext context, int index) {
        return _NewsArticle(article: this.articles[index], index: index);
      },
    );
  }
}

class _NewsArticle extends StatelessWidget {
  const _NewsArticle({
    Key key,
    @required this.article,
    @required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(
          article: article,
          index: index,
        ),
        _CardTitle(
          article: article,
        ),
        _CardImage(
          article: article,
        ),
        _CardBody(
          article: article,
        ),
        _CardButtons(),
        const SizedBox(height: 10),
        const Divider()
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  const _CardTopBar({
    Key key,
    @required this.article,
    @required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: darkTheme.accentColor),
          ),
          Text(
            '${article.source.name}. ',
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        article.title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        child: Container(
          child: (article.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/images/giphy.gif'),
                  image: NetworkImage(article.urlToImage),
                )
              : Image(
                  image: AssetImage('assets/images/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((article.description != null) ? article.description : ''),
    );
  }
}

class _CardButtons extends StatelessWidget {
  const _CardButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: darkTheme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(Icons.star_border),
          ),
          const SizedBox(width: 10.0),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
