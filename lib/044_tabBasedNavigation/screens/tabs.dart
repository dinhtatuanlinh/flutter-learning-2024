import 'package:flutter/material.dart';
import 'package:my_app/screens/categories.dart';
import 'package:my_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    // TODO: implement createState
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen(onToggleFavorite: ,);
    String activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: [],);
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories",),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: "Favorites",),
        ],
      ),
    );
  }
}