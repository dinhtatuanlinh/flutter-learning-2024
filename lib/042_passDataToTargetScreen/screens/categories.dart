import 'package:flutter/material.dart';
import 'package:my_app/data/dummy_data.dart';
import 'package:my_app/screens/meals.dart';
import 'package:my_app/widgets/category_grid_item.dart';
import 'package:my_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // due to statelessWidget there is no context, we need to pass BuildContext as param of method
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (ctx) => MealsScreen(title: "title", meals: [])
    // ));
    // to push a screen on top you can use above method or below method
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeal)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
