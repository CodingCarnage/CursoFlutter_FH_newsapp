import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _NavigationModel navigationModel =
        Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (value) => navigationModel.currentPage = value,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'For you',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Headlines',
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _NavigationModel navigationModel =
        Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;

  PageController _pageController = new PageController();

  int get currentPage => this._currentPage;

  set currentPage(int value) {
    this._currentPage = value;
    this._pageController.animateToPage(
          value,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
