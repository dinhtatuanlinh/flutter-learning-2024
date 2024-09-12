import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/provider/meals_provider.dart';
import 'package:my_app/screens/categories.dart';
import 'package:my_app/screens/filters.dart';
import 'package:my_app/screens/meals.dart';
import 'package:my_app/models/meal.dart';
import 'package:my_app/widgets/main_drawer.dart';
import 'package:my_app/provider/favorites_provider.dart';
import 'package:my_app/provider/filters_provider.dart';


const kInitialFilter = {
  Filter.glutenFree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    // TODO: implement createState
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // we use ref.watch to get data while it change
    final meals = ref.watch(mealsProvider);

    Widget activePage = CategoriesScreen(
      meals: meals,
    );
    String activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = "Your Favorites";
    }

    void _setScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "filter") {
        Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));

      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
