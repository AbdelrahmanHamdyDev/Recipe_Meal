import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Data/dummy_data.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersMealsNotify extends StateNotifier<Map<Filter, bool>> {
  FiltersMealsNotify()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void toggleSingleFilter(Filter filter, bool IsChecked) {
    state = {...state, filter: IsChecked};
  }
}

final Filters = StateNotifierProvider<FiltersMealsNotify, Map<Filter, bool>>(
  (ref) => FiltersMealsNotify(),
);

final FilterMeals = Provider(
  (ref) => dummyMeals.where(
    (meal) {
      final ActivateFilters = ref.watch(Filters);

      if (ActivateFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (ActivateFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (ActivateFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (ActivateFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    },
  ).toList(),
);
