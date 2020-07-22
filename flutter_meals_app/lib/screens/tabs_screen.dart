import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/favourites_screen.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

List<Map<String, Object>> _pages = [
  {'page': CategoriesScreen(), 'title': 'Categories'},
  {'page': FavouritesScreen(), 'title': 'Your Favourites'},
];

class _TabsScreenState extends State<TabsScreen> {
  int selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[selectPageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourites'),
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: _pages[selectPageIndex]['page'],
    );
  }
}
