import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/meal.dart';


// for complex state we need to use StateNotifier class
// it is generic class, so it need to know the type of state which it hold
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    // state is a property which stateNotifier provide. it hold the value of state which we want to transfer
    // in this case state stores list of meal
    final mealIsFavorite = state.contains(meal);

    // we cannot use add and remove function with state which is list type, we just replace it by new value
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }

  String getMealName(Meal meal) {
    return meal.title;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
