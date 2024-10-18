import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Models/meal.dart';

class FavouritesNotify extends StateNotifier<List<Meal>> {
  FavouritesNotify() : super([]);

  bool toggleFavoritesMeals(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final FavouriteMeal = StateNotifierProvider<FavouritesNotify, List<Meal>>(
  (ref) => FavouritesNotify(),
);
