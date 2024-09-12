import 'package:flutter/material.dart';
import 'package:my_app/data/dummy_data.dart';
import 'package:my_app/screens/meals.dart';
import 'package:my_app/widgets/category_grid_item.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> meals;

  const CategoriesScreen({super.key, required this.meals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// animation must use with SingleTickerProviderStateMixin or TickerProviderStateMixin
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // we must to add value to _animationController in initState function
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      // lowerBound should smaller than upperBound this is the size of change
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    // we need dispose animation because we dont want it play at another screen
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // due to statelessWidget there is no context, we need to pass BuildContext as param of method
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = widget.meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (ctx) => MealsScreen(title: "title", meals: [])
    // ));
    // to push a screen on top you can use above method or below method
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
        builder: (context, widget) {
          // return Padding(
          //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),

          // widget is what we use in child of AnimatedBuilder
          //   child: widget,
          // );
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                  parent: _animationController, curve: Curves.decelerate),
            ),
            // widget is what we use in child of AnimatedBuilder
            child: widget,
          );
        });
  }
}
