import 'package:flutter/material.dart';

import 'Home.dart';
import 'More.dart';
import 'WorkOrderQueue.dart';

class Dashboard extends StatefulWidget {
  static const route = 'Dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> pages = ['home', 'queue', 'more'];

  int _currentIndex = 0;

  TextStyle selectedTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.red,
  );
  TextStyle unSelectedTextStyle =
      TextStyle(fontSize: 16.0, color: Colors.black);

  IconThemeData selectedIconStyle = IconThemeData(color: Colors.red);
  IconThemeData unSelectedIconStyle = IconThemeData(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: _getPage(context),
        bottomNavigationBar: _bottomNavigationBar(context, _currentIndex),
      ),
      onWillPop: () async {
        if (_currentIndex == 0) {
          return true;
        } else {
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
      },
    );
  }

  _bottomNavigationBar(BuildContext _context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => changeTab(index),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: selectedTextStyle,
      unselectedLabelStyle: unSelectedTextStyle,
      selectedIconTheme: selectedIconStyle,
      unselectedIconTheme: unSelectedIconStyle,
      items: _getBottomNavigationItems(_context),
    );
  }

  _getBottomNavigationItems(BuildContext context) {
    List<BottomNavigationBarItem> _items = List()
      ..add(
        BottomNavigationBarItem(
          icon: Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.home,
              size: 24.0,
            ),
          ),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      )
      ..add(
        BottomNavigationBarItem(
          icon: Icon(
            Icons.screen_share,
            size: 24.0,
          ),
          title: Text(
            'Work Orders',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      )
      ..add(
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more,
            size: 24.0,
          ),
          title: Text(
            'More',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      );
    return _items;
  }

  changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getPage(BuildContext context) {
    switch (pages[_currentIndex]) {
      case 'home':
        return Home();

      case 'queue':
        return WorkOrderQueueWidget();

      case 'more':
        return More();
    }
  }
}
