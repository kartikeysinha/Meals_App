import 'package:flutter/material.dart';

import './categories_screen.dart';
import '../widgets_screen/favorites_screen.dart';
import '../Widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;

  TabsScreen(this.favMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color.fromRGBO(101, 40, 33, 1),
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text(
              "Categories",
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text(
              "Favorites",
            ),
          )
        ],
      ),
    );
  }
}
