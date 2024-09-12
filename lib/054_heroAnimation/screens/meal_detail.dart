import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/meal.dart';
import 'package:my_app/provider/favorites_provider.dart';

// for StatelessWidget we will use ConsumerWidget for alternative
// while we will use ConsumerStatefulWidget fo StatelessWidget
class MealDetailScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    bool isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                // for call a method in provider we need to use ref.read()
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);

                String mealName =
                    ref.read(favoriteMealsProvider.notifier).getMealName(meal);
                print(mealName);
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 3000),
                // we need to add key to the Icon because flutter use key to differential the change
                // therefore the value of key will be different now we set isFavorite because it will change when the icon change
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
                transitionBuilder: (widget, animation) {
                  // widget is what is used for child of AnimatedSwitcher
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                    child: widget,
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final step in meal.steps)
                Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                )
            ],
          ),
        ));
  }
}
